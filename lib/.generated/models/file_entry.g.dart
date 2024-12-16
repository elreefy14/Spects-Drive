// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../models/file_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileEntryImpl _$$FileEntryImplFromJson(Map<String, dynamic> json) =>
    _$FileEntryImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      hash: json['hash'] as String,
      parentId: json['parent_id'] as int?,
      path: json['path'] as String?,
      extension: json['extension'] as String?,
      fileName: json['file_name'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      mime: json['mime'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      fileSize: json['file_size'] as int?,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isStarred: isStarredMapper(json, 'isStarred') as bool,
      thumbnail: thumbnailMapper(json, 'thumbnail') as bool,
      permissions: EntryPermissions.fromJson(json['permissions']),
      users: (json['users'] as List<dynamic>)
          .map((e) => DriveEntryUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FileEntryImplToJson(_$FileEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hash': instance.hash,
      'parent_id': instance.parentId,
      'path': instance.path,
      'extension': instance.extension,
      'file_name': instance.fileName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'mime': instance.mime,
      'type': instance.type,
      'url': instance.url,
      'file_size': instance.fileSize,
      'tags': instance.tags,
      'isStarred': instance.isStarred,
      'thumbnail': instance.thumbnail,
      'permissions': instance.permissions,
      'users': instance.users,
    };

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      displayName: json['display_name'] as String? ?? '',
      type: json['type'] as String,
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'type': instance.type,
    };
