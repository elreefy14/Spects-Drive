import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../.generated/i18n/backend_locale.freezed.dart';
part '../.generated/i18n/backend_locale.g.dart';

@freezed
class BackendLocale with _$BackendLocale {
  const BackendLocale._();
  const factory BackendLocale({
    required String name,
    required String language,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required Map<String, String?>? lines,
  }) = _BackendLocale;

  factory BackendLocale.fromJson(Map<String, dynamic> json) =>
      _$BackendLocaleFromJson(json);

  factory BackendLocale.fromRawJson(String rawJson) =>
      BackendLocale.fromJson(json.decode(rawJson));

  String toRawJson() => json.encode(toJson());

  Locale toFlutterLocale() {
    return Locale(language);
  }
}
