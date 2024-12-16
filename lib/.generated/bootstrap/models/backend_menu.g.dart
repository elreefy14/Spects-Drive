// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../bootstrap/models/backend_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackendMenuImpl _$$BackendMenuImplFromJson(Map<String, dynamic> json) =>
    _$BackendMenuImpl(
      name: json['name'] as String,
      positions:
          (json['positions'] as List<dynamic>).map((e) => e as String).toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => BackendMenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BackendMenuImplToJson(_$BackendMenuImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'positions': instance.positions,
      'items': instance.items,
    };
