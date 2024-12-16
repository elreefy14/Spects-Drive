import 'package:bedrive/drive/layout/drive_drawer/settings_screen/document_cache_section/cache_usage_provider.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/settings_screen_title.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentCacheSection extends ConsumerWidget {
  const DocumentCacheSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(cacheUsageProvider).valueOrNull ?? '0';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsScreenTitle(name: 'Document cache'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                ref.read(cacheUsageProvider.notifier).clearCache();
                context.showTextSnackBar('Cache cleared');
              },
              child: ListTile(
                title: const StyledText('Clear cache'),
                subtitle: StyledText(
                  'Clear all cached documents (:size)',
                  replacements: {'size': size},
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
