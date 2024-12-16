import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/folders/folder_path_provider.dart';
import 'package:bedrive/drive/illustrated_message.dart';
import 'package:bedrive/drive/layout/app_bar/new_entry_button.dart';
import 'package:bedrive/drive/layout/app_bar/search_button.dart';
import 'package:bedrive/drive/layout/drive_screen_content.dart';
import 'package:bedrive/drive/transfers/ui/transfers_screen_button.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/ui/global_loading_indicator_provider.dart';
import 'package:bedrive/ui/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/file_entry.dart';

class FolderScreen extends ConsumerWidget with GlobalLoadingIndicatorHandler {
  final String folderId;
  final FileEntry? folder;

  const FolderScreen(this.folderId, this.folder, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleGlobalLoadingIndicator(ref);
    final provider = fileEntriesProvider(
      DrivePaginationParams(section: DriveSection.folder, folderId: folderId),
    );
    final entries = ref.watch(provider);

    return Scaffold(
      appBar: _AppBar(entries.valueOrNull?.folder ?? folder),
      body: DriveScreenContent(
        uniqueId: '${DriveSection.folder}-$folderId',
        emptyStateWidget: const IllustratedMessage(
          title: 'This folder is empty',
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

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  final FileEntry? folder;

  const _AppBar(this.folder);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: false,
      title: folder != null
          ? _PathSelector(folder!)
          : const RectShimmer(width: 154, height: 24),
      actions: [
        const TransfersScreenButton(),
        const NewEntryButton(),
        SearchButton(folder: folder),
      ],
    );
  }
}

class _PathSelector extends ConsumerWidget {
  final FileEntry folder;

  const _PathSelector(this.folder);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(folderPathProvider(folder.id.toString()));

    List<DropdownMenuItem<int>> items = [];

    if (path case AsyncData(:final value)) {
      items = value
          .map(
            (entry) => DropdownMenuItem(
              value: entry.id,
              child: Text(entry.name),
            ),
          )
          .toList();
    } else {
      items = [
        DropdownMenuItem(
          value: folder.id,
          child: Text(folder.name),
        ),
      ];
    }

    return InputDecorator(
      expands: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        constraints: BoxConstraints(maxHeight: 34, maxWidth: 154),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: folder.id,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: [
            const DropdownMenuItem(
              value: 0,
              child: Text('All files'),
            ),
            ...items,
          ],
          onChanged: (folderId) {
            if (folderId == folder.id) return;

            if (folderId != null && folderId > 0) {
              ref.context.pushReplacementNamed(
                AppRoute.folder.name,
                pathParameters: {'folderId': folderId.toString()},
                extra: path.valueOrNull?.firstWhere((e) => e.id == folderId),
              );
            } else {
              ref.context.goNamed(AppRoute.home.name);
            }
          },
        ),
      ),
    );
  }
}
