// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../drive/sharing/shareable_link_screen/shareable_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareableLinkImpl _$$ShareableLinkImplFromJson(Map<String, dynamic> json) =>
    _$ShareableLinkImpl(
      id: json['id'] as int,
      hash: json['hash'] as String,
      userId: json['user_id'] as int,
      entryId: json['entry_id'] as int,
      allowEdit: json['allow_edit'] as bool,
      allowDownload: json['allow_download'] as bool,
      password: json['password'] as String?,
      entry: FileEntry.fromJson(json['entry'] as Map<String, dynamic>),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ShareableLinkImplToJson(_$ShareableLinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hash': instance.hash,
      'user_id': instance.userId,
      'entry_id': instance.entryId,
      'allow_edit': instance.allowEdit,
      'allow_download': instance.allowDownload,
      'password': instance.password,
      'entry': instance.entry,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
