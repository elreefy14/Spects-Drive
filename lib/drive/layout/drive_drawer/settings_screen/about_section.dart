import 'package:bedrive/auth/auth_state_provider.dart';
import 'package:bedrive/bootstrap/bootstrap_data_provider.dart';
import 'package:bedrive/bootstrap/local_config_provider.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/settings_screen_title.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiClient = ref.watch(apiClientProvider).requireValue;
    final version = ref.watch(localConfigProvider).requireValue.version;
    final menu =
        ref.watch(bootstrapDataProvider).requireValue.menus.firstOrNull;

    List<Widget> menuItems = [
      ListTile(
        title: const StyledText('View Licenses'),
        onTap: () => showLicensePage(context: context),
      ),
    ];

    if (menu != null) {
      menuItems.addAll(
        menu.items.map(
          (i) => ListTile(
            title: StyledText(i.label),
            onTap: () async {
              final uri = apiClient.buildUri(i.action);
              if (await canLaunchUrl(uri)) {
                launchUrl(uri);
              }
            },
          ),
        ),
      );
    }

    menuItems.add(_DeleteAccountListTile());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsScreenTitle(name: 'About'),
        ListTile(
          title: const StyledText('Version'),
          subtitle: StyledText(version, translate: false),
        ),
        const Divider(),
        ...menuItems,
      ],
    );
  }
}

class _DeleteAccountListTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: StyledText(' Account', color: context.colorScheme.error),
      onTap: () async {
        final apiClient = ref.watch(apiClientProvider).requireValue;
        final user = ref.watch(authStateProvider).requireValue!;
        final confirmed = await context.showAlertDialog(
          isDanger: true,
          title: 'Delete account?',
          body:
              'Your account will be deleted immediately and permanently. Once deleted, accounts can not be restored.',
          actionLabel: 'Delete',
          cancelLabel: 'Cancel',
        );
        if (confirmed != null && confirmed) {
          try {
            await apiClient.delete(
              '/users/${user.id}',
              {'deleteCurrentUser': 'true'},
            );
            ref.read(authStateProvider.notifier).logout();
          } catch (e) {
            context.showErrorSnackBar('Could not delete account.');
          }
        }
      },
    );
  }
}
