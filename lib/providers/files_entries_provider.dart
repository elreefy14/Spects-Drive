import 'dart:async';

import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../drive/drive_pagination_params.dart';
import '../drive/offline/offlined_entries_controller.dart';
import '../models/paginated_file_entries.dart';

part '../.generated/providers/files_entries_provider.g.dart';

@riverpod
class FileEntries extends _$FileEntries {
  Future<void> loadNextPage() async {
    final previous = state.requireValue;
    final driveApi = ref.watch(driveApiProvider).requireValue;
    final lastPage = state.requireValue.lastPage;
    final currentPage = state.requireValue.currentPage;

    // can't load more, bail
    if (state is AsyncLoading || lastPage == currentPage) return;

    state = const AsyncValue.loading();

    try {
      final sort = ref.read(driveScreenSortProvider(sortKey(params)));

      final response = await driveApi.fetchEntries(
        params.copyWith(page: currentPage + 1, sort: params.sort ?? sort),
      );

      state = AsyncValue.data(response.copyWith(
        data: [
          ...previous.data,
          ...response.data,
        ],
      ));
    } catch (err, stacktrace) {
      state = AsyncValue.error(err, stacktrace);
    }
  }

  @override
  Future<PaginatedFileEntries> build(DrivePaginationParams params) async {
    final driveApi = ref.watch(driveApiProvider).requireValue;
    ref.cacheResults();

    // rebuild when entries are offlined/unofflined
    if (params.section == DriveSection.offline) {
      ref.watch(offlinedEntriesControllerProvider);
    }

    // if sort is is provided via params, it's hard-coded on
    // the screen and can't be changed (eg. recent page)
    if (params.sort == null) {
      final sort = ref.watch(driveScreenSortProvider(sortKey(params)));
      params = params.copyWith(sort: sort);
    }

    return driveApi.fetchEntries(params);
  }
}

String sortKey(DrivePaginationParams params) {
  return params.folderId != null
      ? '${params.section}-${params.folderId}'
      : params.section;
}
