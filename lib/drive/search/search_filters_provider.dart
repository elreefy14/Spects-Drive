import 'dart:convert';

import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../.generated/drive/search/search_filters_provider.freezed.dart';
part '../../.generated/drive/search/search_filters_provider.g.dart';

@riverpod
class SearchFilters extends _$SearchFilters {
  setQuery(String? query) {
    state = state.copyWith(query: query);
  }

  setFileType(String? fileType) {
    state = state.copyWith(fileType: fileType);
  }

  setDate(Map<String, String>? date) {
    state = state.copyWith(date: date);
  }

  setSharedByMe(bool? sharedByMe) {
    state = state.copyWith(sharedByMe: sharedByMe);
  }

  setFolderId(int? folderId) {
    state = state.copyWith(folderId: folderId);
  }

  @override
  SearchFiltersValue build() {
    final router = ref.watch(goRouterProvider);
    final folder = router.location.extra as FileEntry?;
    return SearchFiltersValue(
      query: null,
      fileType: null,
      date: null,
      sharedByMe: null,
      folderId: folder?.id,
    );
  }
}

@freezed
class SearchFiltersValue with _$SearchFiltersValue {
  const SearchFiltersValue._();

  const factory SearchFiltersValue({
    required String? query,
    required String? fileType,
    required Map<String, String>? date,
    required bool? sharedByMe,
    required int? folderId,
  }) = _SearchFiltersValue;

  bool get isEmpty {
    return query == null &&
        fileType == null &&
        date == null &&
        sharedByMe == null &&
        folderId == null;
  }

  String encode() {
    final filters = [];
    if (fileType != null) {
      filters.add({
        'key': 'type',
        'value': fileType,
      });
    }
    if (date != null) {
      filters.add({
        'key': 'updated_at',
        'operator': 'between',
        'value': date,
      });
    }
    if (sharedByMe != null && sharedByMe!) {
      filters.add({
        'key': 'sharedByMe',
        'operator': '=',
        'value': 'true',
      });
    }

    if (filters.isEmpty) {
      return '';
    }

    return base64Encode(utf8.encode(json.encode(filters)));
  }
}
