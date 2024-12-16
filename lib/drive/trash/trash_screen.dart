import 'package:bedrive/drive/layout/drive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/files_entries_provider.dart';
import '../drive_pagination_params.dart';
import '../illustrated_message.dart';
import '../layout/drive_screen_content.dart';

class TrashScreen extends ConsumerWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = fileEntriesProvider(
      const DrivePaginationParams(section: DriveSection.trash),
    );
    final entries = ref.watch(provider);

    return DriveScaffold(
      appBar: DriveAppBar(entries: entries, title: 'Trash'),
      child: DriveScreenContent(
        uniqueId: DriveSection.trash,
        emptyStateWidget: const IllustratedMessage(
          title: 'Trash is empty',
          message: 'There are no files or folders in your trash currently',
          assetPath: 'assets/icons/throw-away.svg',
        ),
        onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
        onRefresh: () => ref.refresh(provider.future),
        entries: entries,
      ),
    );
  }
}
