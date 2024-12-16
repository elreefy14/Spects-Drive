import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../router_provider.dart';
import 'notification_type.dart';
import 'payloads/file_shared_notification_payload.dart';
import 'payloads/notification_payload.dart';

part '../../.generated/drive/notifications/local_notifications_provider.g.dart';

@Riverpod(keepAlive: true)
class LocalNotifications extends _$LocalNotifications {
  show(
    String title, {
    String? body,
    String? payload,
    int? localId,
    int? progress,
  }) async {
    final platformChannelSpecifics = NotificationDetails(
      android: _buildAndroidNotificationDetails(progress),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: false,
      ),
    );
    localId ??= Random().nextInt(10000);

    state.show(
      localId,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  cancel(int notifId) {
    state.cancel(notifId);
  }

  Future<dynamic> handleNotificationTapped(String encodedPayload) async {
    NotificationPayload payload =
        NotificationPayload.fromRawJson(encodedPayload);
    final router = ref.read(goRouterProvider);

    if (payload.notifId == NotificationType.transferProgress) {
      router.pushNamed(AppRoute.transfers.name);
    } else if (payload.notifId == NotificationType.fileShared) {
      final fileNotifPayload =
          FileSharedNotificationPayload.fromRawJson(encodedPayload);

      // if not already in shared screen, navigate to shared screen
      final currentRoute = router.routerDelegate.currentConfiguration.uri;
      if (currentRoute.toString() != AppRoute.sharedWithMe.path) {
        router.pushNamed(AppRoute.sharedWithMe.name);
      }

      // open preview screen for the first entry in the notification
      router.pushNamed(
        AppRoute.preview.name,
        pathParameters: {
          'entryId': fileNotifPayload.entryId.toString(),
        },
      );
    }
  }

  AndroidNotificationDetails _buildAndroidNotificationDetails(int? progress) {
    return AndroidNotificationDetails(
      'default',
      'default',
      channelDescription: 'Default channel for the app.',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      showWhen: true,
      category: AndroidNotificationCategory.social,
      playSound: false,
      fullScreenIntent: false,
      enableVibration: false,
      showProgress: progress != null,
      maxProgress: 100,
      progress: progress ?? 0,
    );
  }

  @override
  FlutterLocalNotificationsPlugin build() {
    final local = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const initializationSettingsIOS = DarwinInitializationSettings(
      defaultPresentAlert: false,
      defaultPresentBadge: true,
      defaultPresentSound: false,
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    local.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload != null) {
          handleNotificationTapped(payload);
        }
      },
    );
    return local;
  }
}
