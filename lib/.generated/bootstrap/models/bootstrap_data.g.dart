// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../bootstrap/models/bootstrap_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BootstrapDataImpl _$$BootstrapDataImplFromJson(Map<String, dynamic> json) =>
    _$BootstrapDataImpl(
      locales: (json['locales'] as List<dynamic>)
          .map((e) => BackendLocale.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings:
          BackendSettings.fromJson(json['settings'] as Map<String, dynamic>),
      themes: (json['themes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, BackendTheme.fromJson(e as Map<String, dynamic>)),
      ),
      menus: (json['menus'] as List<dynamic>)
          .map((e) => BackendMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BootstrapDataImplToJson(_$BootstrapDataImpl instance) =>
    <String, dynamic>{
      'locales': instance.locales,
      'settings': instance.settings,
      'themes': instance.themes,
      'menus': instance.menus,
      'user': instance.user,
    };
