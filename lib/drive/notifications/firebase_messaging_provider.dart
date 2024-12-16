import 'dart:convert';

import 'package:bedrive/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/auth_state_provider.dart';
import '../../http/api_client.dart';
import 'local_notifications_provider.dart';

part '../../.generated/drive/notifications/firebase_messaging_provider.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseMessaging?> firebaseMessaging(FirebaseMessagingRef ref) async {
  final localNotifications = ref.read(localNotificationsProvider.notifier);
  final api = ref.read(apiClientProvider).requireValue;

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    return null;
  }

  final fm = FirebaseMessaging.instance;

  fm.requestPermission(sound: false).then((value) {
    // when firebase message is received, show local notification
    FirebaseMessaging.onMessage.listen((message) {
      final title = message.notification?.title;
      if (title != null) {
        localNotifications.show(
          title,
          body: message.notification?.body,
          payload: json.encode(message.data),
        );
      }
    });

    // user tapped on firebase notification, while app was in background or closed.
    // firebase will show the notification itself in this case, based on payload title and body,
    // there's no need to call "localNotifications.show" manually
    FirebaseMessaging.onMessageOpenedApp.listen((e) {
      localNotifications.handleNotificationTapped(json.encode(e.data));
    });
  });

  // sync fcm token with backend
  ref.listen(
    authStateProvider,
    (_, next) async {
      final user = next.value;
      if (user != null) {
        final currentToken = await fm.getToken();
        if (currentToken != user.fcmToken) {
          api.post('fcm-token', {
            'token': currentToken,
            'deviceId': await deviceIdentifier(),
          }).catchError((_) {});
        }
      }
    },
    fireImmediately: true,
  );

  return fm;
}
