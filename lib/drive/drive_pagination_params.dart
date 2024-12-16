import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/drive/search/search_filters_provider.dart';
import 'package:equatable/equatable.dart';

const int drivePageSize = 20;

class DriveSection {
  static const String home = 'home';
  static const String folder = 'folder';
  static const String recent = 'recent';
  static const String starred = 'starred';
  static const String shared = 'sharedWithMe';
  static const String trash = 'trash';
  static const String search = 'search';
  static const String offline = 'offline';
  static const String allChildren = 'allChildren';
}

class DrivePaginationParams extends Equatable {
  final String section;
  final int page;
  final SortDescriptor? sort;
  final String? query;
  final String? folderId;
  final SearchFiltersValue? filters;
  final List<int>? entryIds;

  const DrivePaginationParams({
    required this.section,
    this.page = 1,
    this.sort,
    this.query,
    this.folderId,
    this.filters,
    this.entryIds,
  });

  @override
  List<Object> get props => [
        section,
        page,
        sort ?? '',
        query ?? '',
        folderId ?? '',
        filters ?? '',
        entryIds ?? '',
      ];

  Map<String, String> toMap() {
    final params = {
      'section': section,
      'page': page.toString(),
      'order': sort.toString(),
      'perPage': drivePageSize.toString(),
      'paginate': 'lengthAware',
    };
    if (filters != null) {
      params['filters'] = filters!.encode();
    }
    if (folderId != null) {
      params['folderId'] = folderId!;
    }
    if (query != null && query!.isNotEmpty) {
      params['query'] = query!;
    }
    if (entryIds != null) {
      params['entryIds'] = entryIds!.join(',');
    }
    return params;
  }

  DrivePaginationParams copyWith({
    int? page,
    SortDescriptor? sort,
    List<int>? entryIds,
  }) {
    return DrivePaginationParams(
      section: section,
      page: page ?? this.page,
      sort: sort ?? this.sort,
      query: query,
      folderId: folderId,
      filters: filters,
      entryIds: entryIds ?? this.entryIds,
    );
  }
}
