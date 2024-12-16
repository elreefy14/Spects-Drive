import 'package:bedrive/drive/layout/entry_view/file_thumbnail.dart';
import 'package:bedrive/drive/search/clear_search_filter_tile.dart';
import 'package:bedrive/drive/search/search_filter_button.dart';
import 'package:bedrive/drive/search/search_filters_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const searchFileTypes = <String, String>{
  'image': 'Image',
  'text': 'Text',
  'folder': 'Folder',
  'word': 'Word document',
  'pdf': 'PDF',
  'audio': 'Audio',
  'video': 'Video',
  'spreadsheet': 'Spreadsheet',
  'powerPoint': 'Presentation',
  'archive': 'Archive',
};

class SearchFileTypeFilter extends ConsumerWidget {
  const SearchFileTypeFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchFiltersProvider);

    return SearchFilterButton(
      isActive: state.fileType != null,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => const _FileTypeFilterBottomSheet(),
        );
      },
      label: state.fileType == null
          ? const StyledText('Type')
          : StyledText(searchFileTypes[state.fileType]!),
    );
  }
}

class _FileTypeFilterBottomSheet extends ConsumerWidget {
  const _FileTypeFilterBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(searchFiltersProvider.notifier);
    final hasFileType = ref.watch(searchFiltersProvider).fileType != null;
    return ListView(
      shrinkWrap: true,
      children: [
        ClearSearchFilterTile(
          label: 'Select type',
          filterIsActive: hasFileType,
          onClear: () => filters.setFileType(null),
        ),
        ...searchFileTypes.entries.map(
          (e) => ListTile(
            leading: FileTypeIcon(e.key, size: FileThumbnailSize.tiny),
            title: StyledText(e.value),
            onTap: () {
              filters.setFileType(e.key);
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}
