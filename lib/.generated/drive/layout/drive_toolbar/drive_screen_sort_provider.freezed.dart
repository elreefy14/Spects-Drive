// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../drive/layout/drive_toolbar/drive_screen_sort_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SortDescriptor {
  DriveSortColumn get column => throw _privateConstructorUsedError;
  DriveSortDirection get direction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortDescriptorCopyWith<SortDescriptor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortDescriptorCopyWith<$Res> {
  factory $SortDescriptorCopyWith(
          SortDescriptor value, $Res Function(SortDescriptor) then) =
      _$SortDescriptorCopyWithImpl<$Res, SortDescriptor>;
  @useResult
  $Res call({DriveSortColumn column, DriveSortDirection direction});
}

/// @nodoc
class _$SortDescriptorCopyWithImpl<$Res, $Val extends SortDescriptor>
    implements $SortDescriptorCopyWith<$Res> {
  _$SortDescriptorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? column = null,
    Object? direction = null,
  }) {
    return _then(_value.copyWith(
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as DriveSortColumn,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as DriveSortDirection,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SortDescriptorImplCopyWith<$Res>
    implements $SortDescriptorCopyWith<$Res> {
  factory _$$SortDescriptorImplCopyWith(_$SortDescriptorImpl value,
          $Res Function(_$SortDescriptorImpl) then) =
      __$$SortDescriptorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DriveSortColumn column, DriveSortDirection direction});
}

/// @nodoc
class __$$SortDescriptorImplCopyWithImpl<$Res>
    extends _$SortDescriptorCopyWithImpl<$Res, _$SortDescriptorImpl>
    implements _$$SortDescriptorImplCopyWith<$Res> {
  __$$SortDescriptorImplCopyWithImpl(
      _$SortDescriptorImpl _value, $Res Function(_$SortDescriptorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? column = null,
    Object? direction = null,
  }) {
    return _then(_$SortDescriptorImpl(
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as DriveSortColumn,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as DriveSortDirection,
    ));
  }
}

/// @nodoc

class _$SortDescriptorImpl extends _SortDescriptor {
  const _$SortDescriptorImpl({required this.column, required this.direction})
      : super._();

  @override
  final DriveSortColumn column;
  @override
  final DriveSortDirection direction;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortDescriptorImpl &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, column, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortDescriptorImplCopyWith<_$SortDescriptorImpl> get copyWith =>
      __$$SortDescriptorImplCopyWithImpl<_$SortDescriptorImpl>(
          this, _$identity);
}

abstract class _SortDescriptor extends SortDescriptor {
  const factory _SortDescriptor(
      {required final DriveSortColumn column,
      required final DriveSortDirection direction}) = _$SortDescriptorImpl;
  const _SortDescriptor._() : super._();

  @override
  DriveSortColumn get column;
  @override
  DriveSortDirection get direction;
  @override
  @JsonKey(ignore: true)
  _$$SortDescriptorImplCopyWith<_$SortDescriptorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
