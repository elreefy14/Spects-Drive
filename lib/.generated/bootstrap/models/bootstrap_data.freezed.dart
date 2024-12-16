// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../bootstrap/models/bootstrap_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BootstrapData _$BootstrapDataFromJson(Map<String, dynamic> json) {
  return _BootstrapData.fromJson(json);
}

/// @nodoc
mixin _$BootstrapData {
  List<BackendLocale> get locales => throw _privateConstructorUsedError;
  BackendSettings get settings => throw _privateConstructorUsedError;
  Map<String, BackendTheme> get themes => throw _privateConstructorUsedError;
  List<BackendMenu> get menus => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BootstrapDataCopyWith<BootstrapData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BootstrapDataCopyWith<$Res> {
  factory $BootstrapDataCopyWith(
          BootstrapData value, $Res Function(BootstrapData) then) =
      _$BootstrapDataCopyWithImpl<$Res, BootstrapData>;
  @useResult
  $Res call(
      {List<BackendLocale> locales,
      BackendSettings settings,
      Map<String, BackendTheme> themes,
      List<BackendMenu> menus,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$BootstrapDataCopyWithImpl<$Res, $Val extends BootstrapData>
    implements $BootstrapDataCopyWith<$Res> {
  _$BootstrapDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locales = null,
    Object? settings = null,
    Object? themes = null,
    Object? menus = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      locales: null == locales
          ? _value.locales
          : locales // ignore: cast_nullable_to_non_nullable
              as List<BackendLocale>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as BackendSettings,
      themes: null == themes
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as Map<String, BackendTheme>,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<BackendMenu>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BootstrapDataImplCopyWith<$Res>
    implements $BootstrapDataCopyWith<$Res> {
  factory _$$BootstrapDataImplCopyWith(
          _$BootstrapDataImpl value, $Res Function(_$BootstrapDataImpl) then) =
      __$$BootstrapDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BackendLocale> locales,
      BackendSettings settings,
      Map<String, BackendTheme> themes,
      List<BackendMenu> menus,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$BootstrapDataImplCopyWithImpl<$Res>
    extends _$BootstrapDataCopyWithImpl<$Res, _$BootstrapDataImpl>
    implements _$$BootstrapDataImplCopyWith<$Res> {
  __$$BootstrapDataImplCopyWithImpl(
      _$BootstrapDataImpl _value, $Res Function(_$BootstrapDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locales = null,
    Object? settings = null,
    Object? themes = null,
    Object? menus = null,
    Object? user = freezed,
  }) {
    return _then(_$BootstrapDataImpl(
      locales: null == locales
          ? _value._locales
          : locales // ignore: cast_nullable_to_non_nullable
              as List<BackendLocale>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as BackendSettings,
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as Map<String, BackendTheme>,
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<BackendMenu>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BootstrapDataImpl extends _BootstrapData {
  const _$BootstrapDataImpl(
      {required final List<BackendLocale> locales,
      required this.settings,
      required final Map<String, BackendTheme> themes,
      required final List<BackendMenu> menus,
      this.user})
      : _locales = locales,
        _themes = themes,
        _menus = menus,
        super._();

  factory _$BootstrapDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BootstrapDataImplFromJson(json);

  final List<BackendLocale> _locales;
  @override
  List<BackendLocale> get locales {
    if (_locales is EqualUnmodifiableListView) return _locales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locales);
  }

  @override
  final BackendSettings settings;
  final Map<String, BackendTheme> _themes;
  @override
  Map<String, BackendTheme> get themes {
    if (_themes is EqualUnmodifiableMapView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_themes);
  }

  final List<BackendMenu> _menus;
  @override
  List<BackendMenu> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  final User? user;

  @override
  String toString() {
    return 'BootstrapData(locales: $locales, settings: $settings, themes: $themes, menus: $menus, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BootstrapDataImpl &&
            const DeepCollectionEquality().equals(other._locales, _locales) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_locales),
      settings,
      const DeepCollectionEquality().hash(_themes),
      const DeepCollectionEquality().hash(_menus),
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BootstrapDataImplCopyWith<_$BootstrapDataImpl> get copyWith =>
      __$$BootstrapDataImplCopyWithImpl<_$BootstrapDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BootstrapDataImplToJson(
      this,
    );
  }
}

abstract class _BootstrapData extends BootstrapData {
  const factory _BootstrapData(
      {required final List<BackendLocale> locales,
      required final BackendSettings settings,
      required final Map<String, BackendTheme> themes,
      required final List<BackendMenu> menus,
      final User? user}) = _$BootstrapDataImpl;
  const _BootstrapData._() : super._();

  factory _BootstrapData.fromJson(Map<String, dynamic> json) =
      _$BootstrapDataImpl.fromJson;

  @override
  List<BackendLocale> get locales;
  @override
  BackendSettings get settings;
  @override
  Map<String, BackendTheme> get themes;
  @override
  List<BackendMenu> get menus;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$BootstrapDataImplCopyWith<_$BootstrapDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
