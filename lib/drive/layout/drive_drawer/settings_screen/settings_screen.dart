import 'package:bedrive/drive/layout/drive_drawer/settings_screen/about_section.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/account_section.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/document_cache_section/document_cache_section.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/notification_section/notification_section.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/theme_section.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const StyledText('Settings'),
      ),
      body: const Padding(
          padding: EdgeInsets.only(top: 14, bottom: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountSection(),
                Divider(),
                NotificationSection(),
                Divider(),
                DocumentCacheSection(),
                Divider(),
                ThemeSection(),
                Divider(),
                AboutSection(),
              ],
            ),
          )),
    );
  }
}
