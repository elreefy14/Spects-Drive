// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../bootstrap/models/backend_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackendThemeImpl _$$BackendThemeImplFromJson(Map<String, dynamic> json) =>
    _$BackendThemeImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      isDark: json['is_dark'] as bool,
      defaultDark: json['default_dark'] as bool,
      defaultLight: json['default_light'] as bool,
      values:
          BackendThemeColors.fromJson(json['values'] as Map<String, dynamic>),
      font: json['font'] as String?,
    );

Map<String, dynamic> _$$BackendThemeImplToJson(_$BackendThemeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_dark': instance.isDark,
      'default_dark': instance.defaultDark,
      'default_light': instance.defaultLight,
      'values': instance.values,
      'font': instance.font,
    };
