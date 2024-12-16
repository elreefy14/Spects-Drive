// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../models/drive_entry_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriveEntryUser _$DriveEntryUserFromJson(Map<String, dynamic> json) {
  return _DriveEntryUser.fromJson(json);
}

/// @nodoc
mixin _$DriveEntryUser {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'owns_entry')
  bool get ownsEntry => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_permissions')
  EntryUserPermissions get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriveEntryUserCopyWith<DriveEntryUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveEntryUserCopyWith<$Res> {
  factory $DriveEntryUserCopyWith(
          DriveEntryUser value, $Res Function(DriveEntryUser) then) =
      _$DriveEntryUserCopyWithImpl<$Res, DriveEntryUser>;
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      String? image,
      @JsonKey(name: 'owns_entry') bool ownsEntry,
      @JsonKey(name: 'entry_permissions') EntryUserPermissions permissions});
}

/// @nodoc
class _$DriveEntryUserCopyWithImpl<$Res, $Val extends DriveEntryUser>
    implements $DriveEntryUserCopyWith<$Res> {
  _$DriveEntryUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? image = freezed,
    Object? ownsEntry = null,
    Object? permissions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      ownsEntry: null == ownsEntry
          ? _value.ownsEntry
          : ownsEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as EntryUserPermissions,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriveEntryUserImplCopyWith<$Res>
    implements $DriveEntryUserCopyWith<$Res> {
  factory _$$DriveEntryUserImplCopyWith(_$DriveEntryUserImpl value,
          $Res Function(_$DriveEntryUserImpl) then) =
      __$$DriveEntryUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      String? image,
      @JsonKey(name: 'owns_entry') bool ownsEntry,
      @JsonKey(name: 'entry_permissions') EntryUserPermissions permissions});
}

/// @nodoc
class __$$DriveEntryUserImplCopyWithImpl<$Res>
    extends _$DriveEntryUserCopyWithImpl<$Res, _$DriveEntryUserImpl>
    implements _$$DriveEntryUserImplCopyWith<$Res> {
  __$$DriveEntryUserImplCopyWithImpl(
      _$DriveEntryUserImpl _value, $Res Function(_$DriveEntryUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? image = freezed,
    Object? ownsEntry = null,
    Object? permissions = null,
  }) {
    return _then(_$DriveEntryUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      ownsEntry: null == ownsEntry
          ? _value.ownsEntry
          : ownsEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as EntryUserPermissions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriveEntryUserImpl extends _DriveEntryUser {
  _$DriveEntryUserImpl(
      {required this.id,
      required this.email,
      required this.name,
      this.image,
      @JsonKey(name: 'owns_entry') required this.ownsEntry,
      @JsonKey(name: 'entry_permissions') required this.permissions})
      : super._();

  factory _$DriveEntryUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriveEntryUserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? image;
  @override
  @JsonKey(name: 'owns_entry')
  final bool ownsEntry;
  @override
  @JsonKey(name: 'entry_permissions')
  final EntryUserPermissions permissions;

  @override
  String toString() {
    return 'DriveEntryUser(id: $id, email: $email, name: $name, image: $image, ownsEntry: $ownsEntry, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveEntryUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.ownsEntry, ownsEntry) ||
                other.ownsEntry == ownsEntry) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, image, ownsEntry, permissions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveEntryUserImplCopyWith<_$DriveEntryUserImpl> get copyWith =>
      __$$DriveEntryUserImplCopyWithImpl<_$DriveEntryUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriveEntryUserImplToJson(
      this,
    );
  }
}

abstract class _DriveEntryUser extends DriveEntryUser {
  factory _DriveEntryUser(
      {required final int id,
      required final String email,
      required final String name,
      final String? image,
      @JsonKey(name: 'owns_entry') required final bool ownsEntry,
      @JsonKey(name: 'entry_permissions')
      required final EntryUserPermissions permissions}) = _$DriveEntryUserImpl;
  _DriveEntryUser._() : super._();

  factory _DriveEntryUser.fromJson(Map<String, dynamic> json) =
      _$DriveEntryUserImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String? get image;
  @override
  @JsonKey(name: 'owns_entry')
  bool get ownsEntry;
  @override
  @JsonKey(name: 'entry_permissions')
  EntryUserPermissions get permissions;
  @override
  @JsonKey(ignore: true)
  _$$DriveEntryUserImplCopyWith<_$DriveEntryUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
