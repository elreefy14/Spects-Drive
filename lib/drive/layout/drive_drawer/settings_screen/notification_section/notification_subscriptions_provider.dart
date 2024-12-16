import 'package:bedrive/drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../.generated/drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions_provider.g.dart';

@riverpod
Future<NotificationSubscriptions> notificationSubscriptions(
  NotificationSubscriptionsRef ref,
) async {
  final apiClient = await ref.read(apiClientProvider.future);
  final response = await apiClient.get(
    'notifications/me/subscriptions',
    options: ApiClientOptions(cacheResponse: true),
  );
  return NotificationSubscriptions.fromJson(response);
}
