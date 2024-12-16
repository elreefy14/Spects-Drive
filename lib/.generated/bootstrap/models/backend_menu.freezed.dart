// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../bootstrap/models/backend_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BackendMenu _$BackendMenuFromJson(Map<String, dynamic> json) {
  return _BackendMenu.fromJson(json);
}

/// @nodoc
mixin _$BackendMenu {
  String get name => throw _privateConstructorUsedError;
  List<String> get positions => throw _privateConstructorUsedError;
  List<BackendMenuItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackendMenuCopyWith<BackendMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendMenuCopyWith<$Res> {
  factory $BackendMenuCopyWith(
          BackendMenu value, $Res Function(BackendMenu) then) =
      _$BackendMenuCopyWithImpl<$Res, BackendMenu>;
  @useResult
  $Res call({String name, List<String> positions, List<BackendMenuItem> items});
}

/// @nodoc
class _$BackendMenuCopyWithImpl<$Res, $Val extends BackendMenu>
    implements $BackendMenuCopyWith<$Res> {
  _$BackendMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? positions = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      positions: null == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BackendMenuItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackendMenuImplCopyWith<$Res>
    implements $BackendMenuCopyWith<$Res> {
  factory _$$BackendMenuImplCopyWith(
          _$BackendMenuImpl value, $Res Function(_$BackendMenuImpl) then) =
      __$$BackendMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> positions, List<BackendMenuItem> items});
}

/// @nodoc
class __$$BackendMenuImplCopyWithImpl<$Res>
    extends _$BackendMenuCopyWithImpl<$Res, _$BackendMenuImpl>
    implements _$$BackendMenuImplCopyWith<$Res> {
  __$$BackendMenuImplCopyWithImpl(
      _$BackendMenuImpl _value, $Res Function(_$BackendMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? positions = null,
    Object? items = null,
  }) {
    return _then(_$BackendMenuImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      positions: null == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BackendMenuItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendMenuImpl extends _BackendMenu {
  const _$BackendMenuImpl(
      {required this.name,
      required final List<String> positions,
      required final List<BackendMenuItem> items})
      : _positions = positions,
        _items = items,
        super._();

  factory _$BackendMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendMenuImplFromJson(json);

  @override
  final String name;
  final List<String> _positions;
  @override
  List<String> get positions {
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positions);
  }

  final List<BackendMenuItem> _items;
  @override
  List<BackendMenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BackendMenu(name: $name, positions: $positions, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendMenuImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_positions),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendMenuImplCopyWith<_$BackendMenuImpl> get copyWith =>
      __$$BackendMenuImplCopyWithImpl<_$BackendMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendMenuImplToJson(
      this,
    );
  }
}

abstract class _BackendMenu extends BackendMenu {
  const factory _BackendMenu(
      {required final String name,
      required final List<String> positions,
      required final List<BackendMenuItem> items}) = _$BackendMenuImpl;
  const _BackendMenu._() : super._();

  factory _BackendMenu.fromJson(Map<String, dynamic> json) =
      _$BackendMenuImpl.fromJson;

  @override
  String get name;
  @override
  List<String> get positions;
  @override
  List<BackendMenuItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$BackendMenuImplCopyWith<_$BackendMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
