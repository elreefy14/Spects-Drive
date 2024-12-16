import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_entry.dart';

part '../.generated/models/paginated_file_entries.freezed.dart';
part '../.generated/models/paginated_file_entries.g.dart';

@freezed
class PaginatedFileEntries with _$PaginatedFileEntries {
  factory PaginatedFileEntries({
    required List<FileEntry> data,
    FileEntry? folder,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
    required int total,
  }) = _PaginatedFileEntries;

  factory PaginatedFileEntries.fromJson(Map<String, dynamic> json) =>
      _$PaginatedFileEntriesFromJson(json);
}

final emptyPaginatedFileEntries = PaginatedFileEntries(
  perPage: drivePageSize,
  currentPage: 1,
  lastPage: 1,
  data: [],
  total: 0,
);
