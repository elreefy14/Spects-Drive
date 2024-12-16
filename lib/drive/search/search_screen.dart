import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/illustrated_message.dart';
import 'package:bedrive/drive/layout/drive_screen_content.dart';
import 'package:bedrive/drive/search/search_date_filter.dart';
import 'package:bedrive/drive/search/search_filters_provider.dart';
import 'package:bedrive/drive/search/search_folder_filter.dart';
import 'package:bedrive/drive/search/search_type_filter.dart';
import 'package:bedrive/drive/search/shared_by_me_filter.dart';
import 'package:bedrive/i18n/localization_provider.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/models/paginated_file_entries.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  final FileEntry? folder;

  const SearchScreen({this.folder, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(searchFiltersProvider);
    final isSearchingOrFiltering = filters.query != null || !filters.isEmpty;

    final provider = fileEntriesProvider(
      DrivePaginationParams(
        section: DriveSection.search,
        query: filters.query,
        folderId: filters.folderId?.toString(),
        filters: filters,
      ),
    );

    final entries = !isSearchingOrFiltering
        ? AsyncData(emptyPaginatedFileEntries)
        : ref.watch(provider);

    return Scaffold(
      appBar: SearchAppBar(
        folder: folder,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SearchFileTypeFilter(),
                const SizedBox(width: 10),
                const SearchDateFilter(),
                const SizedBox(width: 10),
                const SharedByMeFilter(),
                if (folder != null) ...[
                  const SizedBox(width: 10),
                  SearchFolderFilter(folder!),
                ],
              ],
            ),
          ),
          Expanded(
            child: DriveScreenContent(
              uniqueId: DriveSection.search,
              hideToolbar: true,
              emptyStateWidget: IllustratedMessage(
                title: isSearchingOrFiltering
                    ? 'No matching results'
                    : 'Begin typing or select a filter to search',
                message: isSearchingOrFiltering
                    ? 'Try changing your search query or filters'
                    : 'Search for files, folders and other content',
                assetPath: 'assets/icons/file-searching.svg',
              ),
              onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
              onRefresh: () => ref.refresh(provider.future),
              entries: entries,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final FileEntry? folder;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const SearchAppBar({
    super.key,
    this.folder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final filters = ref.read(searchFiltersProvider.notifier);
    final localizer = ref.watch(localizationProvider);
    final showClearIcon = useState(false);
    final hasFolderFilter = ref.watch(
      searchFiltersProvider.select((s) => s.folderId != null),
    );

    useEffect(() {
      controller.addListener(() {
        if (showClearIcon.value != controller.text.isNotEmpty) {
          showClearIcon.value = controller.text.isNotEmpty;
        }
      });
      return null;
    }, [controller]);

    final label = !hasFolderFilter
        ? localizer.translate('Search')
        : localizer.translate('Search in :folder', {'folder': folder!.name});

    return AppBar(
      title: SizedBox(
        height: 40,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          onSubmitted: (String value) {
            filters.setQuery(value);
          },
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            hintText: label,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: showClearIcon.value
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      filters.setQuery(null);
                      controller.clear();
                      focusNode.unfocus();
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
