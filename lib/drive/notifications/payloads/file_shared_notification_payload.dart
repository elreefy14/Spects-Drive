import 'dart:convert';

import 'notification_payload.dart';

class FileSharedNotificationPayload extends NotificationPayload {
  final int entryId;
  final bool multiple;

  FileSharedNotificationPayload({
    required this.entryId,
    required this.multiple,
    required super.notifId,
  });

  factory FileSharedNotificationPayload.fromRawJson(String str) =>
      FileSharedNotificationPayload.fromJson(json.decode(str));

  factory FileSharedNotificationPayload.fromJson(Map<String, dynamic> json) =>
      FileSharedNotificationPayload(
        entryId: json["entryId"] == null ? 0 : int.parse(json["entryId"]),
        multiple: json["multiple"] != null && json["multiple"] == 'true',
        notifId: json["notifId"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "entryId": entryId,
        "multiple": multiple,
        "notifId": notifId,
      };
}
