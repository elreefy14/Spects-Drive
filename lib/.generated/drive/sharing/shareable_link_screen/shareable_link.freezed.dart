// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../drive/sharing/shareable_link_screen/shareable_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShareableLink _$ShareableLinkFromJson(Map<String, dynamic> json) {
  return _ShareableLink.fromJson(json);
}

/// @nodoc
mixin _$ShareableLink {
  int get id => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_id')
  int get entryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_edit')
  bool get allowEdit => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_download')
  bool get allowDownload => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  FileEntry get entry => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareableLinkCopyWith<ShareableLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareableLinkCopyWith<$Res> {
  factory $ShareableLinkCopyWith(
          ShareableLink value, $Res Function(ShareableLink) then) =
      _$ShareableLinkCopyWithImpl<$Res, ShareableLink>;
  @useResult
  $Res call(
      {int id,
      String hash,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'entry_id') int entryId,
      @JsonKey(name: 'allow_edit') bool allowEdit,
      @JsonKey(name: 'allow_download') bool allowDownload,
      String? password,
      FileEntry entry,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $FileEntryCopyWith<$Res> get entry;
}

/// @nodoc
class _$ShareableLinkCopyWithImpl<$Res, $Val extends ShareableLink>
    implements $ShareableLinkCopyWith<$Res> {
  _$ShareableLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hash = null,
    Object? userId = null,
    Object? entryId = null,
    Object? allowEdit = null,
    Object? allowDownload = null,
    Object? password = freezed,
    Object? entry = null,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      entryId: null == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDownload: null == allowDownload
          ? _value.allowDownload
          : allowDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as FileEntry,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileEntryCopyWith<$Res> get entry {
    return $FileEntryCopyWith<$Res>(_value.entry, (value) {
      return _then(_value.copyWith(entry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShareableLinkImplCopyWith<$Res>
    implements $ShareableLinkCopyWith<$Res> {
  factory _$$ShareableLinkImplCopyWith(
          _$ShareableLinkImpl value, $Res Function(_$ShareableLinkImpl) then) =
      __$$ShareableLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String hash,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'entry_id') int entryId,
      @JsonKey(name: 'allow_edit') bool allowEdit,
      @JsonKey(name: 'allow_download') bool allowDownload,
      String? password,
      FileEntry entry,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $FileEntryCopyWith<$Res> get entry;
}

/// @nodoc
class __$$ShareableLinkImplCopyWithImpl<$Res>
    extends _$ShareableLinkCopyWithImpl<$Res, _$ShareableLinkImpl>
    implements _$$ShareableLinkImplCopyWith<$Res> {
  __$$ShareableLinkImplCopyWithImpl(
      _$ShareableLinkImpl _value, $Res Function(_$ShareableLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hash = null,
    Object? userId = null,
    Object? entryId = null,
    Object? allowEdit = null,
    Object? allowDownload = null,
    Object? password = freezed,
    Object? entry = null,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ShareableLinkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      entryId: null == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDownload: null == allowDownload
          ? _value.allowDownload
          : allowDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as FileEntry,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareableLinkImpl implements _ShareableLink {
  _$ShareableLinkImpl(
      {required this.id,
      required this.hash,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'entry_id') required this.entryId,
      @JsonKey(name: 'allow_edit') required this.allowEdit,
      @JsonKey(name: 'allow_download') required this.allowDownload,
      required this.password,
      required this.entry,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$ShareableLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareableLinkImplFromJson(json);

  @override
  final int id;
  @override
  final String hash;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'entry_id')
  final int entryId;
  @override
  @JsonKey(name: 'allow_edit')
  final bool allowEdit;
  @override
  @JsonKey(name: 'allow_download')
  final bool allowDownload;
  @override
  final String? password;
  @override
  final FileEntry entry;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ShareableLink(id: $id, hash: $hash, userId: $userId, entryId: $entryId, allowEdit: $allowEdit, allowDownload: $allowDownload, password: $password, entry: $entry, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareableLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.entryId, entryId) || other.entryId == entryId) &&
            (identical(other.allowEdit, allowEdit) ||
                other.allowEdit == allowEdit) &&
            (identical(other.allowDownload, allowDownload) ||
                other.allowDownload == allowDownload) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.entry, entry) || other.entry == entry) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hash,
      userId,
      entryId,
      allowEdit,
      allowDownload,
      password,
      entry,
      expiresAt,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareableLinkImplCopyWith<_$ShareableLinkImpl> get copyWith =>
      __$$ShareableLinkImplCopyWithImpl<_$ShareableLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareableLinkImplToJson(
      this,
    );
  }
}

abstract class _ShareableLink implements ShareableLink {
  factory _ShareableLink(
          {required final int id,
          required final String hash,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'entry_id') required final int entryId,
          @JsonKey(name: 'allow_edit') required final bool allowEdit,
          @JsonKey(name: 'allow_download') required final bool allowDownload,
          required final String? password,
          required final FileEntry entry,
          @JsonKey(name: 'expires_at') final DateTime? expiresAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$ShareableLinkImpl;

  factory _ShareableLink.fromJson(Map<String, dynamic> json) =
      _$ShareableLinkImpl.fromJson;

  @override
  int get id;
  @override
  String get hash;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'entry_id')
  int get entryId;
  @override
  @JsonKey(name: 'allow_edit')
  bool get allowEdit;
  @override
  @JsonKey(name: 'allow_download')
  bool get allowDownload;
  @override
  String? get password;
  @override
  FileEntry get entry;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ShareableLinkImplCopyWith<_$ShareableLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
