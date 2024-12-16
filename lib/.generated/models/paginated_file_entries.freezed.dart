// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../models/paginated_file_entries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedFileEntries _$PaginatedFileEntriesFromJson(Map<String, dynamic> json) {
  return _PaginatedFileEntries.fromJson(json);
}

/// @nodoc
mixin _$PaginatedFileEntries {
  List<FileEntry> get data => throw _privateConstructorUsedError;
  FileEntry? get folder => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedFileEntriesCopyWith<PaginatedFileEntries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedFileEntriesCopyWith<$Res> {
  factory $PaginatedFileEntriesCopyWith(PaginatedFileEntries value,
          $Res Function(PaginatedFileEntries) then) =
      _$PaginatedFileEntriesCopyWithImpl<$Res, PaginatedFileEntries>;
  @useResult
  $Res call(
      {List<FileEntry> data,
      FileEntry? folder,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      int total});

  $FileEntryCopyWith<$Res>? get folder;
}

/// @nodoc
class _$PaginatedFileEntriesCopyWithImpl<$Res,
        $Val extends PaginatedFileEntries>
    implements $PaginatedFileEntriesCopyWith<$Res> {
  _$PaginatedFileEntriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? folder = freezed,
    Object? perPage = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FileEntry>,
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as FileEntry?,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileEntryCopyWith<$Res>? get folder {
    if (_value.folder == null) {
      return null;
    }

    return $FileEntryCopyWith<$Res>(_value.folder!, (value) {
      return _then(_value.copyWith(folder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedFileEntriesImplCopyWith<$Res>
    implements $PaginatedFileEntriesCopyWith<$Res> {
  factory _$$PaginatedFileEntriesImplCopyWith(_$PaginatedFileEntriesImpl value,
          $Res Function(_$PaginatedFileEntriesImpl) then) =
      __$$PaginatedFileEntriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FileEntry> data,
      FileEntry? folder,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      int total});

  @override
  $FileEntryCopyWith<$Res>? get folder;
}

/// @nodoc
class __$$PaginatedFileEntriesImplCopyWithImpl<$Res>
    extends _$PaginatedFileEntriesCopyWithImpl<$Res, _$PaginatedFileEntriesImpl>
    implements _$$PaginatedFileEntriesImplCopyWith<$Res> {
  __$$PaginatedFileEntriesImplCopyWithImpl(_$PaginatedFileEntriesImpl _value,
      $Res Function(_$PaginatedFileEntriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? folder = freezed,
    Object? perPage = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
  }) {
    return _then(_$PaginatedFileEntriesImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FileEntry>,
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as FileEntry?,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedFileEntriesImpl implements _PaginatedFileEntries {
  _$PaginatedFileEntriesImpl(
      {required final List<FileEntry> data,
      this.folder,
      @JsonKey(name: 'per_page') required this.perPage,
      @JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'last_page') required this.lastPage,
      required this.total})
      : _data = data;

  factory _$PaginatedFileEntriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedFileEntriesImplFromJson(json);

  final List<FileEntry> _data;
  @override
  List<FileEntry> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final FileEntry? folder;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  final int total;

  @override
  String toString() {
    return 'PaginatedFileEntries(data: $data, folder: $folder, perPage: $perPage, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedFileEntriesImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      folder,
      perPage,
      currentPage,
      lastPage,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedFileEntriesImplCopyWith<_$PaginatedFileEntriesImpl>
      get copyWith =>
          __$$PaginatedFileEntriesImplCopyWithImpl<_$PaginatedFileEntriesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedFileEntriesImplToJson(
      this,
    );
  }
}

abstract class _PaginatedFileEntries implements PaginatedFileEntries {
  factory _PaginatedFileEntries(
      {required final List<FileEntry> data,
      final FileEntry? folder,
      @JsonKey(name: 'per_page') required final int perPage,
      @JsonKey(name: 'current_page') required final int currentPage,
      @JsonKey(name: 'last_page') required final int lastPage,
      required final int total}) = _$PaginatedFileEntriesImpl;

  factory _PaginatedFileEntries.fromJson(Map<String, dynamic> json) =
      _$PaginatedFileEntriesImpl.fromJson;

  @override
  List<FileEntry> get data;
  @override
  FileEntry? get folder;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedFileEntriesImplCopyWith<_$PaginatedFileEntriesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
