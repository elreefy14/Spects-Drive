// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../drive/drive_state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DriveStateValue {
  List<int> get selectedEntries => throw _privateConstructorUsedError;
  DriveViewMode get activeViewMode => throw _privateConstructorUsedError;
  ThemeMode get activeThemeMode => throw _privateConstructorUsedError;
  DriveMode get driveMode => throw _privateConstructorUsedError;
  int? get activeFolderId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriveStateValueCopyWith<DriveStateValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveStateValueCopyWith<$Res> {
  factory $DriveStateValueCopyWith(
          DriveStateValue value, $Res Function(DriveStateValue) then) =
      _$DriveStateValueCopyWithImpl<$Res, DriveStateValue>;
  @useResult
  $Res call(
      {List<int> selectedEntries,
      DriveViewMode activeViewMode,
      ThemeMode activeThemeMode,
      DriveMode driveMode,
      int? activeFolderId});
}

/// @nodoc
class _$DriveStateValueCopyWithImpl<$Res, $Val extends DriveStateValue>
    implements $DriveStateValueCopyWith<$Res> {
  _$DriveStateValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedEntries = null,
    Object? activeViewMode = null,
    Object? activeThemeMode = null,
    Object? driveMode = null,
    Object? activeFolderId = freezed,
  }) {
    return _then(_value.copyWith(
      selectedEntries: null == selectedEntries
          ? _value.selectedEntries
          : selectedEntries // ignore: cast_nullable_to_non_nullable
              as List<int>,
      activeViewMode: null == activeViewMode
          ? _value.activeViewMode
          : activeViewMode // ignore: cast_nullable_to_non_nullable
              as DriveViewMode,
      activeThemeMode: null == activeThemeMode
          ? _value.activeThemeMode
          : activeThemeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      driveMode: null == driveMode
          ? _value.driveMode
          : driveMode // ignore: cast_nullable_to_non_nullable
              as DriveMode,
      activeFolderId: freezed == activeFolderId
          ? _value.activeFolderId
          : activeFolderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriveStateValueImplCopyWith<$Res>
    implements $DriveStateValueCopyWith<$Res> {
  factory _$$DriveStateValueImplCopyWith(_$DriveStateValueImpl value,
          $Res Function(_$DriveStateValueImpl) then) =
      __$$DriveStateValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> selectedEntries,
      DriveViewMode activeViewMode,
      ThemeMode activeThemeMode,
      DriveMode driveMode,
      int? activeFolderId});
}

/// @nodoc
class __$$DriveStateValueImplCopyWithImpl<$Res>
    extends _$DriveStateValueCopyWithImpl<$Res, _$DriveStateValueImpl>
    implements _$$DriveStateValueImplCopyWith<$Res> {
  __$$DriveStateValueImplCopyWithImpl(
      _$DriveStateValueImpl _value, $Res Function(_$DriveStateValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedEntries = null,
    Object? activeViewMode = null,
    Object? activeThemeMode = null,
    Object? driveMode = null,
    Object? activeFolderId = freezed,
  }) {
    return _then(_$DriveStateValueImpl(
      selectedEntries: null == selectedEntries
          ? _value._selectedEntries
          : selectedEntries // ignore: cast_nullable_to_non_nullable
              as List<int>,
      activeViewMode: null == activeViewMode
          ? _value.activeViewMode
          : activeViewMode // ignore: cast_nullable_to_non_nullable
              as DriveViewMode,
      activeThemeMode: null == activeThemeMode
          ? _value.activeThemeMode
          : activeThemeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      driveMode: null == driveMode
          ? _value.driveMode
          : driveMode // ignore: cast_nullable_to_non_nullable
              as DriveMode,
      activeFolderId: freezed == activeFolderId
          ? _value.activeFolderId
          : activeFolderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$DriveStateValueImpl extends _DriveStateValue {
  const _$DriveStateValueImpl(
      {required final List<int> selectedEntries,
      required this.activeViewMode,
      required this.activeThemeMode,
      required this.driveMode,
      required this.activeFolderId})
      : _selectedEntries = selectedEntries,
        super._();

  final List<int> _selectedEntries;
  @override
  List<int> get selectedEntries {
    if (_selectedEntries is EqualUnmodifiableListView) return _selectedEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedEntries);
  }

  @override
  final DriveViewMode activeViewMode;
  @override
  final ThemeMode activeThemeMode;
  @override
  final DriveMode driveMode;
  @override
  final int? activeFolderId;

  @override
  String toString() {
    return 'DriveStateValue(selectedEntries: $selectedEntries, activeViewMode: $activeViewMode, activeThemeMode: $activeThemeMode, driveMode: $driveMode, activeFolderId: $activeFolderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveStateValueImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedEntries, _selectedEntries) &&
            (identical(other.activeViewMode, activeViewMode) ||
                other.activeViewMode == activeViewMode) &&
            (identical(other.activeThemeMode, activeThemeMode) ||
                other.activeThemeMode == activeThemeMode) &&
            (identical(other.driveMode, driveMode) ||
                other.driveMode == driveMode) &&
            (identical(other.activeFolderId, activeFolderId) ||
                other.activeFolderId == activeFolderId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedEntries),
      activeViewMode,
      activeThemeMode,
      driveMode,
      activeFolderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveStateValueImplCopyWith<_$DriveStateValueImpl> get copyWith =>
      __$$DriveStateValueImplCopyWithImpl<_$DriveStateValueImpl>(
          this, _$identity);
}

abstract class _DriveStateValue extends DriveStateValue {
  const factory _DriveStateValue(
      {required final List<int> selectedEntries,
      required final DriveViewMode activeViewMode,
      required final ThemeMode activeThemeMode,
      required final DriveMode driveMode,
      required final int? activeFolderId}) = _$DriveStateValueImpl;
  const _DriveStateValue._() : super._();

  @override
  List<int> get selectedEntries;
  @override
  DriveViewMode get activeViewMode;
  @override
  ThemeMode get activeThemeMode;
  @override
  DriveMode get driveMode;
  @override
  int? get activeFolderId;
  @override
  @JsonKey(ignore: true)
  _$$DriveStateValueImplCopyWith<_$DriveStateValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
