import 'package:bedrive/drive/search/search_filter_button.dart';
import 'package:bedrive/drive/search/search_filters_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFolderFilter extends ConsumerWidget {
  final FileEntry folder;

  const SearchFolderFilter(this.folder, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchFiltersProvider);
    final filters = ref.read(searchFiltersProvider.notifier);

    return SearchFilterButton(
      isActive: state.folderId != null,
      onPressed: () {
        filters.setFolderId(state.folderId == null ? folder.id : null);
      },
      label: StyledText(folder.name, translate: false),
    );
  }
}
