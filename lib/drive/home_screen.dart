import 'package:bedrive/drive/layout/drive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/files_entries_provider.dart';
import 'drive_pagination_params.dart';
import 'illustrated_message.dart';
import 'layout/drive_screen_content.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = fileEntriesProvider(
      const DrivePaginationParams(section: DriveSection.home),
    );
    final entries = ref.watch(provider);

    return DriveScaffold(
      appBar: DriveAppBar(entries: entries, title: 'Files'),
      child: DriveScreenContent(
        uniqueId: DriveSection.home,
        emptyStateWidget: const IllustratedMessage(
          title: 'You have not uploaded any files yet',
          message: 'Tap + to add files here',
          assetPath: 'assets/icons/add-files.svg',
        ),
        onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
        onRefresh: () => ref.refresh(provider.future),
        entries: entries,
      ),
    );
  }
}
