import 'package:bedrive/bootstrap/preferences_provider.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions_provider.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/settings_screen_title.dart';
import 'package:bedrive/drive/transfers/transfers_notification.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/ui/shimmer.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationSection extends HookConsumerWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(notificationSubscriptionsProvider);
    final content = switch (asyncValue) {
      AsyncData(:final value) => _NotificationList(value),
      AsyncLoading() => const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RectShimmer(width: double.infinity, height: 24),
              SizedBox(height: 15),
              RectShimmer(width: double.infinity, height: 24),
              SizedBox(height: 15),
              RectShimmer(width: double.infinity, height: 24),
            ],
          ),
        ),
      _ => const Padding(
          padding: EdgeInsets.all(16),
          child: StyledText(
            'There was an issue loading notification settings.',
          ),
        ),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsScreenTitle(name: 'Notify me when...'),
        content,
      ],
    );
  }
}

class _NotificationList extends HookConsumerWidget {
  final NotificationSubscriptions data;

  const _NotificationList(this.data);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPrefs = ref.watch(preferencesProvider).requireValue;
    final apiClient = ref.watch(apiClientProvider).requireValue;
    final isSyncing = useState(false);
    // {notifId: isSubscribed}
    final state = useState<Map<String, bool>>({
      ...{for (var v in data.selections) v.notifId: v.channels['mobile']!},
      transferNotifId: sharedPrefs.getBool('notif.$transferNotifId') ?? true,
    });

    toggle(String notifId, bool isSubscribed) async {
      isSyncing.value = true;
      final newValue = state.value..[notifId] = isSubscribed;
      try {
        await apiClient.put(
          'notifications/me/subscriptions',
          {
            'selections': newValue.entries
                .where((e) => e.key != transferNotifId)
                .map(
                  (e) => {
                    'notif_id': e.key,
                    'channels': {'mobile': e.value}
                  },
                )
                .toList(),
          },
        );
      } on ApiClientException catch (e) {
        context.showErrorSnackBar(e.message);
      } finally {
        isSyncing.value = false;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...data.subscriptions.expand(
            (group) {
              return group.items.map(
                (item) {
                  return CheckboxListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: StyledText(item.name),
                    onChanged: isSyncing.value
                        ? null
                        : (bool? v) => toggle(item.notifId, v ?? false),
                    value: state.value[item.notifId] ?? false,
                  );
                },
              );
            },
          ),
          CheckboxListTile(
            visualDensity: const VisualDensity(vertical: -2),
            title: const StyledText('Transfer status changes'),
            onChanged: (bool? v) {
              state.value[transferNotifId] = v ?? false;
              sharedPrefs.setBool('notif.$transferNotifId', v ?? false);
            },
            value: state.value[transferNotifId] ?? false,
          )
        ],
      ),
    );
  }
}
