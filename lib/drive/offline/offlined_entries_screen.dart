import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/illustrated_message.dart';
import 'package:bedrive/drive/layout/drive_screen_content.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:bedrive/ui/global_loading_indicator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfflinedEntriesScreen extends ConsumerWidget
    with GlobalLoadingIndicatorHandler {
  const OfflinedEntriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleGlobalLoadingIndicator(ref);

    final provider = fileEntriesProvider(
      const DrivePaginationParams(section: DriveSection.offline),
    );
    final entries = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: const StyledText('Offline files'),
        centerTitle: false,
      ),
      body: DriveScreenContent(
        uniqueId: DriveSection.offline,
        emptyStateWidget: const IllustratedMessage(
          title: 'No offlined files or folders yet',
          message:
              'Save a file or folder for viewing offline and it will appear here.',
          assetPath: 'assets/icons/online-transactions.svg',
        ),
        onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
        onRefresh: () => ref.refresh(provider.future),
        entries: entries,
      ),
    );
  }
}
