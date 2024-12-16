import 'dart:convert';

class NotificationPayload {
  final String? notifId;

  NotificationPayload({
    this.notifId,
  });

  factory NotificationPayload.fromRawJson(String str) => NotificationPayload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationPayload.fromJson(Map<String, dynamic> json) => NotificationPayload(
    notifId: json["notifId"],
  );

  Map<String, dynamic> toJson() => {
    "notifId": notifId,
  };
}
