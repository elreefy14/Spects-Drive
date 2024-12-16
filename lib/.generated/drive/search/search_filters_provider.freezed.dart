// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../drive/search/search_filters_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchFiltersValue {
  String? get query => throw _privateConstructorUsedError;
  String? get fileType => throw _privateConstructorUsedError;
  Map<String, String>? get date => throw _privateConstructorUsedError;
  bool? get sharedByMe => throw _privateConstructorUsedError;
  int? get folderId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchFiltersValueCopyWith<SearchFiltersValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFiltersValueCopyWith<$Res> {
  factory $SearchFiltersValueCopyWith(
          SearchFiltersValue value, $Res Function(SearchFiltersValue) then) =
      _$SearchFiltersValueCopyWithImpl<$Res, SearchFiltersValue>;
  @useResult
  $Res call(
      {String? query,
      String? fileType,
      Map<String, String>? date,
      bool? sharedByMe,
      int? folderId});
}

/// @nodoc
class _$SearchFiltersValueCopyWithImpl<$Res, $Val extends SearchFiltersValue>
    implements $SearchFiltersValueCopyWith<$Res> {
  _$SearchFiltersValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? fileType = freezed,
    Object? date = freezed,
    Object? sharedByMe = freezed,
    Object? folderId = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      sharedByMe: freezed == sharedByMe
          ? _value.sharedByMe
          : sharedByMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFiltersValueImplCopyWith<$Res>
    implements $SearchFiltersValueCopyWith<$Res> {
  factory _$$SearchFiltersValueImplCopyWith(_$SearchFiltersValueImpl value,
          $Res Function(_$SearchFiltersValueImpl) then) =
      __$$SearchFiltersValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      String? fileType,
      Map<String, String>? date,
      bool? sharedByMe,
      int? folderId});
}

/// @nodoc
class __$$SearchFiltersValueImplCopyWithImpl<$Res>
    extends _$SearchFiltersValueCopyWithImpl<$Res, _$SearchFiltersValueImpl>
    implements _$$SearchFiltersValueImplCopyWith<$Res> {
  __$$SearchFiltersValueImplCopyWithImpl(_$SearchFiltersValueImpl _value,
      $Res Function(_$SearchFiltersValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? fileType = freezed,
    Object? date = freezed,
    Object? sharedByMe = freezed,
    Object? folderId = freezed,
  }) {
    return _then(_$SearchFiltersValueImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value._date
          : date // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      sharedByMe: freezed == sharedByMe
          ? _value.sharedByMe
          : sharedByMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SearchFiltersValueImpl extends _SearchFiltersValue {
  const _$SearchFiltersValueImpl(
      {required this.query,
      required this.fileType,
      required final Map<String, String>? date,
      required this.sharedByMe,
      required this.folderId})
      : _date = date,
        super._();

  @override
  final String? query;
  @override
  final String? fileType;
  final Map<String, String>? _date;
  @override
  Map<String, String>? get date {
    final value = _date;
    if (value == null) return null;
    if (_date is EqualUnmodifiableMapView) return _date;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? sharedByMe;
  @override
  final int? folderId;

  @override
  String toString() {
    return 'SearchFiltersValue(query: $query, fileType: $fileType, date: $date, sharedByMe: $sharedByMe, folderId: $folderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFiltersValueImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            const DeepCollectionEquality().equals(other._date, _date) &&
            (identical(other.sharedByMe, sharedByMe) ||
                other.sharedByMe == sharedByMe) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, fileType,
      const DeepCollectionEquality().hash(_date), sharedByMe, folderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFiltersValueImplCopyWith<_$SearchFiltersValueImpl> get copyWith =>
      __$$SearchFiltersValueImplCopyWithImpl<_$SearchFiltersValueImpl>(
          this, _$identity);
}

abstract class _SearchFiltersValue extends SearchFiltersValue {
  const factory _SearchFiltersValue(
      {required final String? query,
      required final String? fileType,
      required final Map<String, String>? date,
      required final bool? sharedByMe,
      required final int? folderId}) = _$SearchFiltersValueImpl;
  const _SearchFiltersValue._() : super._();

  @override
  String? get query;
  @override
  String? get fileType;
  @override
  Map<String, String>? get date;
  @override
  bool? get sharedByMe;
  @override
  int? get folderId;
  @override
  @JsonKey(ignore: true)
  _$$SearchFiltersValueImplCopyWith<_$SearchFiltersValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
