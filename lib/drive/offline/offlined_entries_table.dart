import 'package:drift/drift.dart';

@TableIndex(name: 'path', columns: {#path})
class OfflinedEntriesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 1000)();

  TextColumn get hash => text().withLength(max: 100)();

  IntColumn get parentId => integer().nullable()();

  TextColumn get path => text().nullable()();

  TextColumn get extension => text().withLength(max: 200).nullable()();

  TextColumn get fileName => text().withLength(max: 1000)();

  DateTimeColumn get createdAt => dateTime().nullable()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
  
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();

  TextColumn get mime => text().withLength(max: 200).nullable()();

  TextColumn get type => text().withLength(max: 200).nullable()();

  TextColumn get url => text().nullable()();

  IntColumn get fileSize => integer().nullable()();

  TextColumn get tags => text().nullable()();

  BoolColumn get thumbnail => boolean().withDefault(const Constant(false))();

  TextColumn get permissions => text().nullable()();

  TextColumn get users => text().nullable()();

  IntColumn get workspaceId => integer().withDefault(const Constant(0))();
}
