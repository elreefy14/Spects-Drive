// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../models/paginated_file_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedFileEntriesImpl _$$PaginatedFileEntriesImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedFileEntriesImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => FileEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      folder: json['folder'] == null
          ? null
          : FileEntry.fromJson(json['folder'] as Map<String, dynamic>),
      perPage: json['per_page'] as int,
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$PaginatedFileEntriesImplToJson(
        _$PaginatedFileEntriesImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'folder': instance.folder,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total': instance.total,
    };
