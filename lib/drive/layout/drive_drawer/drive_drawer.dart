import 'package:bedrive/drive/layout/drive_drawer/space_usage_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/auth_state_provider.dart';
import '../../../i18n/styled_text.dart';
import '../../../router_provider.dart';

class DriveDrawer extends ConsumerWidget {
  const DriveDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _CurrentUser(),
          ListTile(
            leading: const Icon(Icons.compare_arrows_outlined),
            title: const StyledText('Transfers'),
            onTap: () {
              context.pop();
              context.pushNamed(AppRoute.transfers.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.offline_pin_outlined),
            title: const StyledText('Files available offline'),
            onTap: () {
              context.pop();
              context.pushNamed(AppRoute.offline.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline_outlined),
            title: const StyledText('Recycle bin'),
            onTap: () {
              context.pop();
              context.pushNamed(AppRoute.trash.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const StyledText('Settings'),
            onTap: () {
              context.pop();
              context.pushNamed(AppRoute.settings.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const StyledText('Sign out'),
            onTap: () {
              ref.read(authStateProvider.notifier).logout();
            },
          ),
          const Divider(),
          ListTile(
            leading: Container(
                width: 24,
                alignment: Alignment.topLeft,
                child: const Icon(Icons.storage_outlined)),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: StyledText('Storage', weight: FontWeight.normal),
            ),
            subtitle: _SpaceUsage(),
          ),
        ],
      ),
    );
  }
}

class _CurrentUser extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authStateProvider).valueOrNull;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? context.colorScheme.onBackground
        : context.colorScheme.onPrimary;

    if (currentUser == null) {
      return const SizedBox.shrink();
    }

    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: isDarkMode
            ? context.colorScheme.background
            : context.colorScheme.primary,
      ),
      accountName: StyledText(
        currentUser.name,
        translate: false,
        color: textColor,
      ),
      accountEmail: StyledText(
        currentUser.email,
        translate: false,
        color: textColor,
      ),
      currentAccountPicture: CircleAvatar(
        radius: 15,
        backgroundImage: currentUser.image != null
            ? CachedNetworkImageProvider(currentUser.image!)
            : null,
        child: currentUser.image == null
            ? Text(currentUser.name.substring(1, 3))
            : null,
      ),
    );
  }
}

class _SpaceUsage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usage = ref.watch(spaceUsageProvider);

    return switch (usage) {
      AsyncData(:final value) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: value.usedPercentage / 100),
            const SizedBox(height: 7),
            Directionality(
              textDirection: TextDirection.ltr,
              child: StyledText(
                ':used of :available used',
                replacements: {
                  'used': value.humanReadableUsed,
                  'available': value.humanReadableAvailable
                },
              ),
            )
          ],
        ),
      AsyncLoading() => const LinearProgressIndicator(),
      _ => const LinearProgressIndicator(value: 0),
    };
  }
}
