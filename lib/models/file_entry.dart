import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'drive_entry_user.dart';

part '../.generated/models/file_entry.freezed.dart';
part '../.generated/models/file_entry.g.dart';

bool toBool(dynamic value) {
  if (value == 1 || value == true || value == 'true') {
    return true;
  }
  return false;
}

Object? thumbnailMapper(json, field) => toBool(json['thumbnail']);

Object? isStarredMapper(json, field) {
  if (json['tags'] == null) {
    return false;
  }
  return (json['tags'] as List).firstWhere(
        (tag) => tag['name'] == 'starred',
        orElse: () => null,
      ) !=
      null;
}

@freezed
class FileEntry with _$FileEntry implements BaseFileEntry {
  const FileEntry._();

  factory FileEntry({
    required int id,
    required String name,
    required String hash,
    @JsonKey(name: 'parent_id') required int? parentId,
    required String? path,
    required String? extension,
    @JsonKey(name: 'file_name', defaultValue: '') required String fileName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? mime,
    String? type,
    String? url,
    @JsonKey(name: 'file_size') int? fileSize,
    @Default([]) List<Tag> tags,
    @JsonKey(readValue: isStarredMapper) required bool isStarred,
    @JsonKey(readValue: thumbnailMapper) required bool thumbnail,
    required EntryPermissions permissions,
    required List<DriveEntryUser> users,
  }) = _FileEntry;

  factory FileEntry.fromJson(Map<String, dynamic> json) =>
      _$FileEntryFromJson(json);

  toStable() {
    return StableFileEntry(
      id: id,
      name: name,
      hash: hash,
      parentId: parentId,
      path: path,
      extension: extension,
      fileName: fileName,
      mime: mime,
      type: type,
      url: url,
      fileSize: fileSize,
    );
  }
}

@freezed
class StableFileEntry with _$StableFileEntry implements BaseFileEntry {
  const StableFileEntry._();

  factory StableFileEntry({
    required int id,
    required String name,
    required String hash,
    required String fileName,
    int? parentId,
    String? path,
    String? extension,
    String? mime,
    String? type,
    String? url,
    int? fileSize,
  }) = _StableFileEntry;
}

class EntryPermissions extends Equatable {
  final bool download;
  final bool create;
  final bool update;
  final bool delete;

  const EntryPermissions({
    required this.download,
    required this.create,
    required this.update,
    required this.delete,
  });

  factory EntryPermissions.fromJson(dynamic value) {
    if (value == null || value is List) {
      return const EntryPermissions(
        download: false,
        create: false,
        update: false,
        delete: false,
      );
    }

    return EntryPermissions(
      download: value['files.download'] ?? false,
      create: value['files.create'] ?? false,
      update: value['files.update'] ?? false,
      delete: value['files.delete'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'files.download': download,
        'files.create': create,
        'files.update': update,
        'files.delete': delete,
      };

  String toRawJson() {
    return jsonEncode(toJson());
  }

  @override
  List<Object?> get props => [download, create, update, delete];
}

abstract class BaseFileEntry {
  abstract final int id;
  abstract final String name;
  abstract final String hash;
  abstract final int? parentId;
  abstract final String? path;
  abstract final String? extension;
  abstract final String fileName;
  abstract final String? mime;
  abstract final String? type;
  abstract final String? url;
  abstract final int? fileSize;
}

@freezed
class Tag with _$Tag {
  const Tag._();

  factory Tag({
    required int id,
    required String name,
    @JsonKey(name: 'display_name', defaultValue: '')
    required String displayName,
    required String type,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  String toRawJson() => jsonEncode(toJson());
}
