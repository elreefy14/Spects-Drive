import 'dart:io';

import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/offline/offlined_entries_database.dart';
import 'package:bedrive/drive/offline/offlined_entries_path_provider.dart';
import 'package:bedrive/drive/transfers/models/download_transfer_task.dart';
import 'package:bedrive/drive/transfers/models/transfer_queue_item.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/models/paginated_file_entries.dart';
import 'package:bedrive/providers/transfer_queue_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../.generated/drive/offline/offlined_entries_controller.g.dart';

@Riverpod(keepAlive: true)
class OfflinedEntriesController extends _$OfflinedEntriesController {
  Future<PaginatedFileEntries?> maybeLoadEntries(
      DrivePaginationParams params) async {
    final db = ref.read(offlineEntriesDatabaseProvider);
    final offlinedEntries = await future;
    final folderId =
        params.section == DriveSection.folder && params.folderId != null
            ? int.parse(params.folderId!)
            : null;

    // if it's offlined entries screen, always load
    if (params.section == DriveSection.offline) {
      return db.loadEntries(params);
    }

    // if it's a folder screen, load only if that folder is offlined
    if (folderId != null && offlinedEntries.contains(folderId)) {
      return db.loadEntries(params);
    }

    return null;
  }

  Future<void> makeAvailableOffline(List<FileEntry> entries) async {
    final db = ref.read(offlineEntriesDatabaseProvider);
    final driveApi = ref.read(driveApiProvider).requireValue;
    final transfers = ref.read(transferQueueProvider.notifier);

    // split into files and folders
    final List<FileEntry> files = [];
    final List<FileEntry> folders = [];
    for (final entry in entries) {
      entry.type == 'folder' ? folders.add(entry) : files.add(entry);
    }

    // enqueue files
    db.insertAll(files);
    final tasks = files.map((file) => _taskFor(file));
    await transfers.enqueueDownloads(tasks.toList());

    // enqueue all children of folders
    for (final folder in folders) {
      final children = await driveApi.fetchAllFolderChildren(folder);
      db.insertAll([...children.data, folder]);
      final tasks = children.data.where((e) => e.type != 'folder').map((child) {
        return _taskFor(child);
      });
      await transfers.enqueueDownloads(tasks.toList());
    }

    ref.invalidateSelf();
  }

  Future<void> unoffline(List<FileEntry> entries) async {
    final transfers = ref.read(transferQueueProvider.notifier);
    final db = ref.read(offlineEntriesDatabaseProvider);
    final offlinePath = ref.read(offlinedEntriesPathProvider.notifier);

    // this will remove entries as well as all their children and return ids of all entries that were removed
    final allEntries = await db.delete(entries);

    for (final entry in allEntries) {
      final file = File(offlinePath.forEntry(entry.toStable()));
      if (file.existsSync()) {
        file.delete();
      }
    }

    await transfers.cancel(allEntries.map((e) => _taskIdFor(e.id)).toList());

    ref.invalidateSelf();
  }

  syncWithBackend() async {
    final db = ref.read(offlineEntriesDatabaseProvider);
    final api = ref.read(apiClientProvider).requireValue;
    final path = ref.read(offlinedEntriesPathProvider.notifier);

    // fetch entries from local db that need to be synced
    final entriesToSync = await db.getEntriesForSync();
    if (entriesToSync.isEmpty) return;

    // fetch entries from backend based on local db ids
    final response = await api.post(
      'file-entries/sync-info',
      {'entryIds': entriesToSync.map((e) => e.id).toList()},
    );
    final syncInfo = (response['entries'] as List)
        .map(
          (e) => StableFileEntry(
            id: e['id'],
            name: e['file_name'],
            fileName: e['file_name'],
            fileSize: e['file_size'],
            extension: e['extension'],
            hash: e['hash'],
          ),
        )
        .toList();
    final backendIds = syncInfo.map((e) => e.id).toList();

    final List<FileEntry> entriesToDelete = [];
    final List<FileEntry> entriesToKeep = [];

    for (final entry in entriesToSync) {
      // find entries that need to be deleted
      if (!backendIds.contains(entry.id)) {
        entriesToDelete.add(entry);
      } else {
        entriesToKeep.add(entry);
      }
    }

    if (entriesToDelete.isNotEmpty) {
      // delete locally stored files
      for (final entry in entriesToDelete) {
        final file = File(path.forEntry(entry));
        if (file.existsSync()) {
          file.delete();
        }
      }

      // delete from db
      await db.delete(entriesToDelete.toList());
    }

    if (entriesToKeep.isNotEmpty) {
      await db.updateLastSyncedAt(entriesToKeep);
    }

    ref.invalidateSelf();
  }

  String _taskIdFor(int entryId) {
    return 'perm-offline-$entryId';
  }

  DownloadTransferTask _taskFor(FileEntry entry) {
    final path = ref
        .read(offlinedEntriesPathProvider.notifier)
        .forEntry(entry.toStable());
    return DownloadTransferTask(
      entry: entry,
      id: _taskIdFor(entry.id),
      type: TransferType.offline,
      path: path,
    );
  }

  @override
  Future<List<int>> build() async {
    await ref.read(offlinedEntriesPathProvider.future);
    final database = ref.watch(offlineEntriesDatabaseProvider);
    return await database.getIds();
  }
}
