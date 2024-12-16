import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../.generated/bootstrap/models/backend_menu.freezed.dart';

part '../../.generated/bootstrap/models/backend_menu.g.dart';

@freezed
class BackendMenu with _$BackendMenu{
  const BackendMenu._();

  const factory BackendMenu({
    required String name,
    required List<String> positions,
    required List<BackendMenuItem> items,
  }) = _BackendMenu;

  factory BackendMenu.fromJson(Map<String, dynamic> json) =>
      _$BackendMenuFromJson(json);

  factory BackendMenu.fromRawJson(String rawJson) =>
      BackendMenu.fromJson(json.decode(rawJson));

  String toRawJson() => json.encode(toJson());
}

class BackendMenuItem {
  final String label;
  final String action;
  final String type;

  BackendMenuItem({
    required this.label,
    required this.action,
    required this.type,
  });

  factory BackendMenuItem.fromJson(Map<String, dynamic> value) {
    return BackendMenuItem(
      label: value['label'],
      action: value['action'],
      type: value['type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'action': action,
        'type': type,
      };
}
