// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../bootstrap/models/backend_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BackendTheme _$BackendThemeFromJson(Map<String, dynamic> json) {
  return _BackendTheme.fromJson(json);
}

/// @nodoc
mixin _$BackendTheme {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_dark')
  bool get isDark => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_dark')
  bool get defaultDark => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_light')
  bool get defaultLight => throw _privateConstructorUsedError;
  BackendThemeColors get values => throw _privateConstructorUsedError;
  String? get font => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackendThemeCopyWith<BackendTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendThemeCopyWith<$Res> {
  factory $BackendThemeCopyWith(
          BackendTheme value, $Res Function(BackendTheme) then) =
      _$BackendThemeCopyWithImpl<$Res, BackendTheme>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'is_dark') bool isDark,
      @JsonKey(name: 'default_dark') bool defaultDark,
      @JsonKey(name: 'default_light') bool defaultLight,
      BackendThemeColors values,
      String? font});
}

/// @nodoc
class _$BackendThemeCopyWithImpl<$Res, $Val extends BackendTheme>
    implements $BackendThemeCopyWith<$Res> {
  _$BackendThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isDark = null,
    Object? defaultDark = null,
    Object? defaultLight = null,
    Object? values = null,
    Object? font = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDark: null == isDark
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultDark: null == defaultDark
          ? _value.defaultDark
          : defaultDark // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLight: null == defaultLight
          ? _value.defaultLight
          : defaultLight // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as BackendThemeColors,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackendThemeImplCopyWith<$Res>
    implements $BackendThemeCopyWith<$Res> {
  factory _$$BackendThemeImplCopyWith(
          _$BackendThemeImpl value, $Res Function(_$BackendThemeImpl) then) =
      __$$BackendThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'is_dark') bool isDark,
      @JsonKey(name: 'default_dark') bool defaultDark,
      @JsonKey(name: 'default_light') bool defaultLight,
      BackendThemeColors values,
      String? font});
}

/// @nodoc
class __$$BackendThemeImplCopyWithImpl<$Res>
    extends _$BackendThemeCopyWithImpl<$Res, _$BackendThemeImpl>
    implements _$$BackendThemeImplCopyWith<$Res> {
  __$$BackendThemeImplCopyWithImpl(
      _$BackendThemeImpl _value, $Res Function(_$BackendThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isDark = null,
    Object? defaultDark = null,
    Object? defaultLight = null,
    Object? values = null,
    Object? font = freezed,
  }) {
    return _then(_$BackendThemeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDark: null == isDark
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultDark: null == defaultDark
          ? _value.defaultDark
          : defaultDark // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultLight: null == defaultLight
          ? _value.defaultLight
          : defaultLight // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as BackendThemeColors,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendThemeImpl extends _BackendTheme {
  const _$BackendThemeImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'is_dark') required this.isDark,
      @JsonKey(name: 'default_dark') required this.defaultDark,
      @JsonKey(name: 'default_light') required this.defaultLight,
      required this.values,
      this.font})
      : super._();

  factory _$BackendThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendThemeImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'is_dark')
  final bool isDark;
  @override
  @JsonKey(name: 'default_dark')
  final bool defaultDark;
  @override
  @JsonKey(name: 'default_light')
  final bool defaultLight;
  @override
  final BackendThemeColors values;
  @override
  final String? font;

  @override
  String toString() {
    return 'BackendTheme(id: $id, name: $name, isDark: $isDark, defaultDark: $defaultDark, defaultLight: $defaultLight, values: $values, font: $font)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendThemeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDark, isDark) || other.isDark == isDark) &&
            (identical(other.defaultDark, defaultDark) ||
                other.defaultDark == defaultDark) &&
            (identical(other.defaultLight, defaultLight) ||
                other.defaultLight == defaultLight) &&
            (identical(other.values, values) || other.values == values) &&
            (identical(other.font, font) || other.font == font));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, isDark, defaultDark, defaultLight, values, font);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendThemeImplCopyWith<_$BackendThemeImpl> get copyWith =>
      __$$BackendThemeImplCopyWithImpl<_$BackendThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendThemeImplToJson(
      this,
    );
  }
}

abstract class _BackendTheme extends BackendTheme {
  const factory _BackendTheme(
      {required final int id,
      required final String name,
      @JsonKey(name: 'is_dark') required final bool isDark,
      @JsonKey(name: 'default_dark') required final bool defaultDark,
      @JsonKey(name: 'default_light') required final bool defaultLight,
      required final BackendThemeColors values,
      final String? font}) = _$BackendThemeImpl;
  const _BackendTheme._() : super._();

  factory _BackendTheme.fromJson(Map<String, dynamic> json) =
      _$BackendThemeImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'is_dark')
  bool get isDark;
  @override
  @JsonKey(name: 'default_dark')
  bool get defaultDark;
  @override
  @JsonKey(name: 'default_light')
  bool get defaultLight;
  @override
  BackendThemeColors get values;
  @override
  String? get font;
  @override
  @JsonKey(ignore: true)
  _$$BackendThemeImplCopyWith<_$BackendThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
