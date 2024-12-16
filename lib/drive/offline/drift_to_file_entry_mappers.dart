import 'dart:convert';

import 'package:bedrive/drive/database.dart';
import 'package:bedrive/models/drive_entry_user.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:drift/drift.dart';

FileEntry driftToFileEntry(OfflinedEntriesTableData data) {
  final List<Tag> tags = data.tags != null
      ? (jsonDecode(data.tags!) as List).map((e) => Tag.fromJson(e)).toList()
      : [];
  return FileEntry(
    id: data.id,
    name: data.name,
    hash: data.hash,
    parentId: data.parentId,
    path: data.path,
    extension: data.extension,
    fileName: data.fileName,
    createdAt: data.createdAt,
    updatedAt: data.updatedAt,
    mime: data.mime,
    type: data.type,
    url: data.url,
    fileSize: data.fileSize,
    tags: tags,
    isStarred: tags.any((tag) => tag.name == 'starred'),
    thumbnail: data.thumbnail,
    permissions: data.permissions != null
        ? EntryPermissions.fromJson(jsonDecode(data.permissions!))
        : const EntryPermissions(
            create: false,
            download: false,
            delete: false,
            update: false,
          ),
    users: data.users != null
        ? (jsonDecode(data.users!) as List)
            .map((e) => DriveEntryUser.fromJson(e))
            .toList()
        : [],
  );
}

OfflinedEntriesTableCompanion fileEntryToDrift(FileEntry entry) {
  return OfflinedEntriesTableCompanion.insert(
    id: Value(entry.id),
    name: entry.name,
    hash: entry.hash,
    parentId: Value(entry.parentId),
    path: Value(entry.path),
    extension: Value(entry.extension),
    fileName: entry.fileName,
    createdAt: Value(entry.createdAt),
    updatedAt: Value(entry.updatedAt),
    mime: Value(entry.mime),
    type: Value(entry.type),
    url: Value(entry.url),
    fileSize: Value(entry.fileSize),
    tags: Value(
      jsonEncode(entry.tags.map((e) => e.toRawJson()).toList()),
    ),
    thumbnail: Value.absentIfNull(entry.thumbnail),
    permissions: Value(entry.permissions.toRawJson()),
    users: Value(
      jsonEncode(
        entry.users.map((e) => e.toJson()).toList(),
      ),
    ),
  );
}
