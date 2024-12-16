import 'package:bedrive/auth/auth_state_provider.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/settings_screen_title.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountSection extends ConsumerWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authStateProvider).requireValue!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsScreenTitle(name: 'Account'),
        ListTile(
          title: StyledText(currentUser.email, translate: false),
          subtitle: const StyledText('Sign out'),
          trailing: Icon(
            Icons.exit_to_app_outlined,
            color: context.colorScheme.primary,
          ),
          onTap: () async {
            final confirmed = await context.showAlertDialog(
              title: 'Sign out',
              body: 'Are you sure you want to sign out of this account?',
              actionLabel: 'Sign out',
              cancelLabel: 'Cancel',
            );
            if (confirmed != null && confirmed) {
              ref.read(authStateProvider.notifier).logout();
            }
          },
        ),
      ],
    );
  }
}
