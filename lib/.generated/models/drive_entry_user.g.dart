// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../models/drive_entry_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriveEntryUserImpl _$$DriveEntryUserImplFromJson(Map<String, dynamic> json) =>
    _$DriveEntryUserImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      ownsEntry: json['owns_entry'] as bool,
      permissions: EntryUserPermissions.fromJson(json['entry_permissions']),
    );

Map<String, dynamic> _$$DriveEntryUserImplToJson(
        _$DriveEntryUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
      'owns_entry': instance.ownsEntry,
      'entry_permissions': instance.permissions,
    };
