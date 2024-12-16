// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../i18n/backend_locale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackendLocaleImpl _$$BackendLocaleImplFromJson(Map<String, dynamic> json) =>
    _$BackendLocaleImpl(
      name: json['name'] as String,
      language: json['language'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      lines: (json['lines'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$$BackendLocaleImplToJson(_$BackendLocaleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'updated_at': instance.updatedAt.toIso8601String(),
      'lines': instance.lines,
    };
