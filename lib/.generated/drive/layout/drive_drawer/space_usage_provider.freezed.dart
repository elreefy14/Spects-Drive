// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../drive/layout/drive_drawer/space_usage_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpaceUsage _$SpaceUsageFromJson(Map<String, dynamic> json) {
  return _SpaceUsage.fromJson(json);
}

/// @nodoc
mixin _$SpaceUsage {
  int get used => throw _privateConstructorUsedError;
  int get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpaceUsageCopyWith<SpaceUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpaceUsageCopyWith<$Res> {
  factory $SpaceUsageCopyWith(
          SpaceUsage value, $Res Function(SpaceUsage) then) =
      _$SpaceUsageCopyWithImpl<$Res, SpaceUsage>;
  @useResult
  $Res call({int used, int available});
}

/// @nodoc
class _$SpaceUsageCopyWithImpl<$Res, $Val extends SpaceUsage>
    implements $SpaceUsageCopyWith<$Res> {
  _$SpaceUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? used = null,
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpaceUsageImplCopyWith<$Res>
    implements $SpaceUsageCopyWith<$Res> {
  factory _$$SpaceUsageImplCopyWith(
          _$SpaceUsageImpl value, $Res Function(_$SpaceUsageImpl) then) =
      __$$SpaceUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int used, int available});
}

/// @nodoc
class __$$SpaceUsageImplCopyWithImpl<$Res>
    extends _$SpaceUsageCopyWithImpl<$Res, _$SpaceUsageImpl>
    implements _$$SpaceUsageImplCopyWith<$Res> {
  __$$SpaceUsageImplCopyWithImpl(
      _$SpaceUsageImpl _value, $Res Function(_$SpaceUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? used = null,
    Object? available = null,
  }) {
    return _then(_$SpaceUsageImpl(
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpaceUsageImpl extends _SpaceUsage {
  const _$SpaceUsageImpl({required this.used, required this.available})
      : super._();

  factory _$SpaceUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpaceUsageImplFromJson(json);

  @override
  final int used;
  @override
  final int available;

  @override
  String toString() {
    return 'SpaceUsage(used: $used, available: $available)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpaceUsageImpl &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, used, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpaceUsageImplCopyWith<_$SpaceUsageImpl> get copyWith =>
      __$$SpaceUsageImplCopyWithImpl<_$SpaceUsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpaceUsageImplToJson(
      this,
    );
  }
}

abstract class _SpaceUsage extends SpaceUsage {
  const factory _SpaceUsage(
      {required final int used,
      required final int available}) = _$SpaceUsageImpl;
  const _SpaceUsage._() : super._();

  factory _SpaceUsage.fromJson(Map<String, dynamic> json) =
      _$SpaceUsageImpl.fromJson;

  @override
  int get used;
  @override
  int get available;
  @override
  @JsonKey(ignore: true)
  _$$SpaceUsageImplCopyWith<_$SpaceUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
