import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/settings_screen_title.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ThemeSection extends ConsumerWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(
      driveStateProvider.select((s) => s.activeThemeMode),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsScreenTitle(name: 'Theme'),
        ListTile(
          onTap: () async {
            final newMode = await showDialog<ThemeMode?>(
              context: context,
              builder: (BuildContext context) => _ChooseThemeDialog(),
            );
            if (newMode != null) {
              ref.read(driveStateProvider.notifier).setThemeMode(newMode);
            }
          },
          title: const StyledText('Choose theme'),
          subtitle: switch (selectedMode) {
            ThemeMode.dark => const StyledText('Dark'),
            ThemeMode.light => const StyledText('Light'),
            _ => const StyledText('System default'),
          },
        ),
      ],
    );
  }
}

class _ChooseThemeDialog extends ConsumerWidget {
  @override
  build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(
      driveStateProvider.select((s) => s.activeThemeMode),
    );
    return AlertDialog(
      title: const StyledText('Choose theme'),
      contentPadding: const EdgeInsets.only(top: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile<ThemeMode>(
            title: const StyledText('Dark'),
            value: ThemeMode.dark,
            groupValue: selectedMode,
            onChanged: (ThemeMode? value) => context.pop(value),
          ),
          RadioListTile<ThemeMode>(
            title: const StyledText('Light'),
            value: ThemeMode.light,
            groupValue: selectedMode,
            onChanged: (ThemeMode? value) => context.pop(value),
          ),
          RadioListTile<ThemeMode>(
            title: const StyledText('System default'),
            value: ThemeMode.system,
            groupValue: selectedMode,
            onChanged: (ThemeMode? value) => context.pop(value),
          ),
        ],
      ),
      actions: [
        FilledButton(
          child: const StyledText('Cancel'),
          onPressed: () {
            context.pop(null);
          },
        ),
      ],
    );
  }
}
