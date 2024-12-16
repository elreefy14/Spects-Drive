import 'package:bedrive/drive/database.dart';
import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/drive/offline/drift_to_file_entry_mappers.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/models/paginated_file_entries.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../.generated/drive/offline/offlined_entries_database.g.dart';

@Riverpod(keepAlive: true)
OfflineEntriesDatabase offlineEntriesDatabase(OfflineEntriesDatabaseRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return OfflineEntriesDatabase(db);
}

class OfflineEntriesDatabase {
  final AppDatabase _db;

  OfflineEntriesDatabase(this._db);

  $OfflinedEntriesTableTable get _tbl => _db.offlinedEntriesTable;

  Future<PaginatedFileEntries> loadEntries(DrivePaginationParams params) async {
    final offset = (params.page - 1) * drivePageSize;
    final limit = params.page + drivePageSize;
    final parentId = params.folderId;
    final orderDir = params.sort?.direction ?? DriveSortDirection.desc;
    final orderCol = params.sort?.column ?? DriveSortColumn.updatedAt;

    whereSelector($OfflinedEntriesTableTable t) {
      if (parentId != null) {
        return t.parentId.equals(int.parse(parentId));
      } else {
        return t.parentId.isNull();
      }
    }

    final totalQuery = await (_db.selectOnly(_tbl)
          ..where(whereSelector(_tbl))
          ..addColumns([_tbl.id.count()]))
        .getSingleOrNull();
    final total = totalQuery?.read(_tbl.id.count()) ?? 0;

    final dataQuery = _db.select(_tbl)
      ..limit(limit, offset: offset)
      ..orderBy([
        (t) {
          final mode = orderDir == DriveSortDirection.asc
              ? OrderingMode.asc
              : OrderingMode.desc;
          final column = switch (orderCol) {
            DriveSortColumn.fileSize => t.fileSize,
            DriveSortColumn.updatedAt => t.updatedAt,
            DriveSortColumn.createdAt => t.createdAt,
            DriveSortColumn.type => t.type,
            DriveSortColumn.extension => t.extension,
            DriveSortColumn.name => t.name,
          };
          return OrderingTerm(expression: column, mode: mode);
        }
      ])
      ..where((t) {
        if (parentId != null) {
          return t.parentId.equals(int.parse(parentId));
        } else {
          return t.parentId.isNull();
        }
      });
    final data = await dataQuery.get();

    return PaginatedFileEntries(
      perPage: drivePageSize,
      currentPage: params.page,
      total: total,
      lastPage: (total / drivePageSize).ceil(),
      data: data.map((e) => driftToFileEntry(e)).toList(),
    );
  }

  Future<List<int>> getIds() async {
    final results = await (_db.selectOnly(_tbl)..addColumns([_tbl.id])).get();
    return results.map((e) => e.read(_tbl.id)!).toList();
  }

  Future<List<FileEntry>> getEntriesForSync() async {
    final query = _db.select(_tbl)
      ..orderBy(
        [
          (t) =>
              OrderingTerm(expression: t.lastSyncedAt, mode: OrderingMode.asc)
        ],
      )
      ..limit(50);
    return (await query.get()).map((e) => driftToFileEntry(e)).toList();
  }

  Future<void> updateLastSyncedAt(List<FileEntry> entries) async {
    final ids = entries.map((e) => e.id).toList();
    await (_db.update(_tbl)..where((t) => t.id.isIn(ids))).write(
      OfflinedEntriesTableCompanion(lastSyncedAt: Value(DateTime.now())),
    );
  }

  Future<void> insertAll(List<FileEntry> entry) {
    return _db.batch((batch) {
      final rows = entry.map((e) => fileEntryToDrift(e)).toList();
      batch.insertAllOnConflictUpdate(_tbl, rows);
    });
  }

  Future<List<FileEntry>> delete(List<FileEntry> entries) async {
    final allEntries = [...entries];
    final folders =
        entries.where((e) => e.type == 'folder').map((e) => e).toList();

    // load all children at all depths for specified folders
    for (final folder in folders) {
      final query = _db.select(_tbl)
        ..where((t) => t.path.like("${folder.path}/%"));
      allEntries.addAll((await query.get()).map((e) => driftToFileEntry(e)));
    }

    final deleteQuery = _db.delete(_tbl)
      ..where((t) => t.id.isIn(allEntries.map((e) => e.id)));
    await deleteQuery.go();
    return allEntries;
  }
}
