import 'package:bedrive/drive/layout/drive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/files_entries_provider.dart';
import '../drive_pagination_params.dart';
import '../illustrated_message.dart';
import '../layout/drive_screen_content.dart';

class SharedWithMeScreen extends ConsumerWidget {
  const SharedWithMeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = fileEntriesProvider(
      const DrivePaginationParams(section: DriveSection.shared),
    );
    final entries = ref.watch(provider);

    return DriveScaffold(
      appBar: DriveAppBar(entries: entries, title: 'Shared with me'),
      child: DriveScreenContent(
        uniqueId: DriveSection.shared,
        emptyStateWidget: const IllustratedMessage(
          title: 'Shared with me',
          message: 'Files and folders other people have shared with you',
          assetPath: 'assets/icons/files-sent.svg',
        ),
        onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
        onRefresh: () => ref.refresh(provider.future),
        entries: entries,
      ),
    );
  }
}
