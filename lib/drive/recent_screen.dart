import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/illustrated_message.dart';
import 'package:bedrive/drive/layout/drive_scaffold.dart';
import 'package:bedrive/drive/layout/drive_screen_content.dart';
import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentScreen extends ConsumerWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const sortDescriptor = SortDescriptor(
      column: DriveSortColumn.createdAt,
      direction: DriveSortDirection.desc,
    );
    final provider = fileEntriesProvider(
      const DrivePaginationParams(
        section: DriveSection.recent,
        sort: sortDescriptor,
      ),
    );
    final entries = ref.watch(provider);

    return DriveScaffold(
      appBar: DriveAppBar(entries: entries, title: 'Recent'),
      child: DriveScreenContent(
        uniqueId: DriveSection.recent,
        sortDescriptor: sortDescriptor,
        emptyStateWidget: const IllustratedMessage(
          title: 'No recent entries',
          message: 'You have not uploaded any files or folders yet',
          assetPath: 'assets/icons/time-management.svg',
        ),
        onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
        onRefresh: () => ref.refresh(provider.future),
        entries: entries,
      ),
    );
  }
}
