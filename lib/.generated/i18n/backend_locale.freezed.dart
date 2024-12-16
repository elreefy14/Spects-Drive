// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../i18n/backend_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BackendLocale _$BackendLocaleFromJson(Map<String, dynamic> json) {
  return _BackendLocale.fromJson(json);
}

/// @nodoc
mixin _$BackendLocale {
  String get name => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Map<String, String?>? get lines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackendLocaleCopyWith<BackendLocale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendLocaleCopyWith<$Res> {
  factory $BackendLocaleCopyWith(
          BackendLocale value, $Res Function(BackendLocale) then) =
      _$BackendLocaleCopyWithImpl<$Res, BackendLocale>;
  @useResult
  $Res call(
      {String name,
      String language,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Map<String, String?>? lines});
}

/// @nodoc
class _$BackendLocaleCopyWithImpl<$Res, $Val extends BackendLocale>
    implements $BackendLocaleCopyWith<$Res> {
  _$BackendLocaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? language = null,
    Object? updatedAt = null,
    Object? lines = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lines: freezed == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackendLocaleImplCopyWith<$Res>
    implements $BackendLocaleCopyWith<$Res> {
  factory _$$BackendLocaleImplCopyWith(
          _$BackendLocaleImpl value, $Res Function(_$BackendLocaleImpl) then) =
      __$$BackendLocaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String language,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Map<String, String?>? lines});
}

/// @nodoc
class __$$BackendLocaleImplCopyWithImpl<$Res>
    extends _$BackendLocaleCopyWithImpl<$Res, _$BackendLocaleImpl>
    implements _$$BackendLocaleImplCopyWith<$Res> {
  __$$BackendLocaleImplCopyWithImpl(
      _$BackendLocaleImpl _value, $Res Function(_$BackendLocaleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? language = null,
    Object? updatedAt = null,
    Object? lines = freezed,
  }) {
    return _then(_$BackendLocaleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lines: freezed == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendLocaleImpl extends _BackendLocale {
  const _$BackendLocaleImpl(
      {required this.name,
      required this.language,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required final Map<String, String?>? lines})
      : _lines = lines,
        super._();

  factory _$BackendLocaleImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendLocaleImplFromJson(json);

  @override
  final String name;
  @override
  final String language;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final Map<String, String?>? _lines;
  @override
  Map<String, String?>? get lines {
    final value = _lines;
    if (value == null) return null;
    if (_lines is EqualUnmodifiableMapView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BackendLocale(name: $name, language: $language, updatedAt: $updatedAt, lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendLocaleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, language, updatedAt,
      const DeepCollectionEquality().hash(_lines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendLocaleImplCopyWith<_$BackendLocaleImpl> get copyWith =>
      __$$BackendLocaleImplCopyWithImpl<_$BackendLocaleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendLocaleImplToJson(
      this,
    );
  }
}

abstract class _BackendLocale extends BackendLocale {
  const factory _BackendLocale(
      {required final String name,
      required final String language,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final Map<String, String?>? lines}) = _$BackendLocaleImpl;
  const _BackendLocale._() : super._();

  factory _BackendLocale.fromJson(Map<String, dynamic> json) =
      _$BackendLocaleImpl.fromJson;

  @override
  String get name;
  @override
  String get language;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  Map<String, String?>? get lines;
  @override
  @JsonKey(ignore: true)
  _$$BackendLocaleImplCopyWith<_$BackendLocaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
