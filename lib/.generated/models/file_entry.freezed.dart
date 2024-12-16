// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../models/file_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileEntry _$FileEntryFromJson(Map<String, dynamic> json) {
  return _FileEntry.fromJson(json);
}

/// @nodoc
mixin _$FileEntry {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get extension => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_name', defaultValue: '')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get mime => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_size')
  int? get fileSize => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  @JsonKey(readValue: isStarredMapper)
  bool get isStarred => throw _privateConstructorUsedError;
  @JsonKey(readValue: thumbnailMapper)
  bool get thumbnail => throw _privateConstructorUsedError;
  EntryPermissions get permissions => throw _privateConstructorUsedError;
  List<DriveEntryUser> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileEntryCopyWith<FileEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileEntryCopyWith<$Res> {
  factory $FileEntryCopyWith(FileEntry value, $Res Function(FileEntry) then) =
      _$FileEntryCopyWithImpl<$Res, FileEntry>;
  @useResult
  $Res call(
      {int id,
      String name,
      String hash,
      @JsonKey(name: 'parent_id') int? parentId,
      String? path,
      String? extension,
      @JsonKey(name: 'file_name', defaultValue: '') String fileName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? mime,
      String? type,
      String? url,
      @JsonKey(name: 'file_size') int? fileSize,
      List<Tag> tags,
      @JsonKey(readValue: isStarredMapper) bool isStarred,
      @JsonKey(readValue: thumbnailMapper) bool thumbnail,
      EntryPermissions permissions,
      List<DriveEntryUser> users});
}

/// @nodoc
class _$FileEntryCopyWithImpl<$Res, $Val extends FileEntry>
    implements $FileEntryCopyWith<$Res> {
  _$FileEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hash = null,
    Object? parentId = freezed,
    Object? path = freezed,
    Object? extension = freezed,
    Object? fileName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mime = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? fileSize = freezed,
    Object? tags = null,
    Object? isStarred = null,
    Object? thumbnail = null,
    Object? permissions = null,
    Object? users = null,
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
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      isStarred: null == isStarred
          ? _value.isStarred
          : isStarred // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as EntryPermissions,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DriveEntryUser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileEntryImplCopyWith<$Res>
    implements $FileEntryCopyWith<$Res> {
  factory _$$FileEntryImplCopyWith(
          _$FileEntryImpl value, $Res Function(_$FileEntryImpl) then) =
      __$$FileEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String hash,
      @JsonKey(name: 'parent_id') int? parentId,
      String? path,
      String? extension,
      @JsonKey(name: 'file_name', defaultValue: '') String fileName,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? mime,
      String? type,
      String? url,
      @JsonKey(name: 'file_size') int? fileSize,
      List<Tag> tags,
      @JsonKey(readValue: isStarredMapper) bool isStarred,
      @JsonKey(readValue: thumbnailMapper) bool thumbnail,
      EntryPermissions permissions,
      List<DriveEntryUser> users});
}

/// @nodoc
class __$$FileEntryImplCopyWithImpl<$Res>
    extends _$FileEntryCopyWithImpl<$Res, _$FileEntryImpl>
    implements _$$FileEntryImplCopyWith<$Res> {
  __$$FileEntryImplCopyWithImpl(
      _$FileEntryImpl _value, $Res Function(_$FileEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hash = null,
    Object? parentId = freezed,
    Object? path = freezed,
    Object? extension = freezed,
    Object? fileName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mime = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? fileSize = freezed,
    Object? tags = null,
    Object? isStarred = null,
    Object? thumbnail = null,
    Object? permissions = null,
    Object? users = null,
  }) {
    return _then(_$FileEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      isStarred: null == isStarred
          ? _value.isStarred
          : isStarred // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as EntryPermissions,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<DriveEntryUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileEntryImpl extends _FileEntry {
  _$FileEntryImpl(
      {required this.id,
      required this.name,
      required this.hash,
      @JsonKey(name: 'parent_id') required this.parentId,
      required this.path,
      required this.extension,
      @JsonKey(name: 'file_name', defaultValue: '') required this.fileName,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.mime,
      this.type,
      this.url,
      @JsonKey(name: 'file_size') this.fileSize,
      final List<Tag> tags = const [],
      @JsonKey(readValue: isStarredMapper) required this.isStarred,
      @JsonKey(readValue: thumbnailMapper) required this.thumbnail,
      required this.permissions,
      required final List<DriveEntryUser> users})
      : _tags = tags,
        _users = users,
        super._();

  factory _$FileEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileEntryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String hash;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @override
  final String? path;
  @override
  final String? extension;
  @override
  @JsonKey(name: 'file_name', defaultValue: '')
  final String fileName;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final String? mime;
  @override
  final String? type;
  @override
  final String? url;
  @override
  @JsonKey(name: 'file_size')
  final int? fileSize;
  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(readValue: isStarredMapper)
  final bool isStarred;
  @override
  @JsonKey(readValue: thumbnailMapper)
  final bool thumbnail;
  @override
  final EntryPermissions permissions;
  final List<DriveEntryUser> _users;
  @override
  List<DriveEntryUser> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'FileEntry(id: $id, name: $name, hash: $hash, parentId: $parentId, path: $path, extension: $extension, fileName: $fileName, createdAt: $createdAt, updatedAt: $updatedAt, mime: $mime, type: $type, url: $url, fileSize: $fileSize, tags: $tags, isStarred: $isStarred, thumbnail: $thumbnail, permissions: $permissions, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isStarred, isStarred) ||
                other.isStarred == isStarred) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      hash,
      parentId,
      path,
      extension,
      fileName,
      createdAt,
      updatedAt,
      mime,
      type,
      url,
      fileSize,
      const DeepCollectionEquality().hash(_tags),
      isStarred,
      thumbnail,
      permissions,
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileEntryImplCopyWith<_$FileEntryImpl> get copyWith =>
      __$$FileEntryImplCopyWithImpl<_$FileEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileEntryImplToJson(
      this,
    );
  }
}

abstract class _FileEntry extends FileEntry {
  factory _FileEntry(
      {required final int id,
      required final String name,
      required final String hash,
      @JsonKey(name: 'parent_id') required final int? parentId,
      required final String? path,
      required final String? extension,
      @JsonKey(name: 'file_name', defaultValue: '')
      required final String fileName,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final String? mime,
      final String? type,
      final String? url,
      @JsonKey(name: 'file_size') final int? fileSize,
      final List<Tag> tags,
      @JsonKey(readValue: isStarredMapper) required final bool isStarred,
      @JsonKey(readValue: thumbnailMapper) required final bool thumbnail,
      required final EntryPermissions permissions,
      required final List<DriveEntryUser> users}) = _$FileEntryImpl;
  _FileEntry._() : super._();

  factory _FileEntry.fromJson(Map<String, dynamic> json) =
      _$FileEntryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get hash;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
  @override
  String? get path;
  @override
  String? get extension;
  @override
  @JsonKey(name: 'file_name', defaultValue: '')
  String get fileName;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  String? get mime;
  @override
  String? get type;
  @override
  String? get url;
  @override
  @JsonKey(name: 'file_size')
  int? get fileSize;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(readValue: isStarredMapper)
  bool get isStarred;
  @override
  @JsonKey(readValue: thumbnailMapper)
  bool get thumbnail;
  @override
  EntryPermissions get permissions;
  @override
  List<DriveEntryUser> get users;
  @override
  @JsonKey(ignore: true)
  _$$FileEntryImplCopyWith<_$FileEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StableFileEntry {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get extension => throw _privateConstructorUsedError;
  String? get mime => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int? get fileSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StableFileEntryCopyWith<StableFileEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StableFileEntryCopyWith<$Res> {
  factory $StableFileEntryCopyWith(
          StableFileEntry value, $Res Function(StableFileEntry) then) =
      _$StableFileEntryCopyWithImpl<$Res, StableFileEntry>;
  @useResult
  $Res call(
      {int id,
      String name,
      String hash,
      String fileName,
      int? parentId,
      String? path,
      String? extension,
      String? mime,
      String? type,
      String? url,
      int? fileSize});
}

/// @nodoc
class _$StableFileEntryCopyWithImpl<$Res, $Val extends StableFileEntry>
    implements $StableFileEntryCopyWith<$Res> {
  _$StableFileEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hash = null,
    Object? fileName = null,
    Object? parentId = freezed,
    Object? path = freezed,
    Object? extension = freezed,
    Object? mime = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? fileSize = freezed,
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
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StableFileEntryImplCopyWith<$Res>
    implements $StableFileEntryCopyWith<$Res> {
  factory _$$StableFileEntryImplCopyWith(_$StableFileEntryImpl value,
          $Res Function(_$StableFileEntryImpl) then) =
      __$$StableFileEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String hash,
      String fileName,
      int? parentId,
      String? path,
      String? extension,
      String? mime,
      String? type,
      String? url,
      int? fileSize});
}

/// @nodoc
class __$$StableFileEntryImplCopyWithImpl<$Res>
    extends _$StableFileEntryCopyWithImpl<$Res, _$StableFileEntryImpl>
    implements _$$StableFileEntryImplCopyWith<$Res> {
  __$$StableFileEntryImplCopyWithImpl(
      _$StableFileEntryImpl _value, $Res Function(_$StableFileEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hash = null,
    Object? fileName = null,
    Object? parentId = freezed,
    Object? path = freezed,
    Object? extension = freezed,
    Object? mime = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? fileSize = freezed,
  }) {
    return _then(_$StableFileEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$StableFileEntryImpl extends _StableFileEntry {
  _$StableFileEntryImpl(
      {required this.id,
      required this.name,
      required this.hash,
      required this.fileName,
      this.parentId,
      this.path,
      this.extension,
      this.mime,
      this.type,
      this.url,
      this.fileSize})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String hash;
  @override
  final String fileName;
  @override
  final int? parentId;
  @override
  final String? path;
  @override
  final String? extension;
  @override
  final String? mime;
  @override
  final String? type;
  @override
  final String? url;
  @override
  final int? fileSize;

  @override
  String toString() {
    return 'StableFileEntry(id: $id, name: $name, hash: $hash, fileName: $fileName, parentId: $parentId, path: $path, extension: $extension, mime: $mime, type: $type, url: $url, fileSize: $fileSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StableFileEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, hash, fileName,
      parentId, path, extension, mime, type, url, fileSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StableFileEntryImplCopyWith<_$StableFileEntryImpl> get copyWith =>
      __$$StableFileEntryImplCopyWithImpl<_$StableFileEntryImpl>(
          this, _$identity);
}

abstract class _StableFileEntry extends StableFileEntry {
  factory _StableFileEntry(
      {required final int id,
      required final String name,
      required final String hash,
      required final String fileName,
      final int? parentId,
      final String? path,
      final String? extension,
      final String? mime,
      final String? type,
      final String? url,
      final int? fileSize}) = _$StableFileEntryImpl;
  _StableFileEntry._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  String get hash;
  @override
  String get fileName;
  @override
  int? get parentId;
  @override
  String? get path;
  @override
  String? get extension;
  @override
  String? get mime;
  @override
  String? get type;
  @override
  String? get url;
  @override
  int? get fileSize;
  @override
  @JsonKey(ignore: true)
  _$$StableFileEntryImplCopyWith<_$StableFileEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'display_name', defaultValue: '') String displayName,
      String type});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? type = null,
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
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagImplCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$TagImplCopyWith(_$TagImpl value, $Res Function(_$TagImpl) then) =
      __$$TagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'display_name', defaultValue: '') String displayName,
      String type});
}

/// @nodoc
class __$$TagImplCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$TagImpl>
    implements _$$TagImplCopyWith<$Res> {
  __$$TagImplCopyWithImpl(_$TagImpl _value, $Res Function(_$TagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? type = null,
  }) {
    return _then(_$TagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagImpl extends _Tag {
  _$TagImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'display_name', defaultValue: '')
      required this.displayName,
      required this.type})
      : super._();

  factory _$TagImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'display_name', defaultValue: '')
  final String displayName;
  @override
  final String type;

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, displayName: $displayName, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      __$$TagImplCopyWithImpl<_$TagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagImplToJson(
      this,
    );
  }
}

abstract class _Tag extends Tag {
  factory _Tag(
      {required final int id,
      required final String name,
      @JsonKey(name: 'display_name', defaultValue: '')
      required final String displayName,
      required final String type}) = _$TagImpl;
  _Tag._() : super._();

  factory _Tag.fromJson(Map<String, dynamic> json) = _$TagImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'display_name', defaultValue: '')
  String get displayName;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
