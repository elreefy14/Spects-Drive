// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../drive/database.dart';

// ignore_for_file: type=lint
class $OfflinedEntriesTableTable extends OfflinedEntriesTable
    with TableInfo<$OfflinedEntriesTableTable, OfflinedEntriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflinedEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extensionMeta =
      const VerificationMeta('extension');
  @override
  late final GeneratedColumn<String> extension = GeneratedColumn<String>(
      'extension', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _mimeMeta = const VerificationMeta('mime');
  @override
  late final GeneratedColumn<String> mime = GeneratedColumn<String>(
      'mime', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
      'file_size', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<bool> thumbnail = GeneratedColumn<bool>(
      'thumbnail', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("thumbnail" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _permissionsMeta =
      const VerificationMeta('permissions');
  @override
  late final GeneratedColumn<String> permissions = GeneratedColumn<String>(
      'permissions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _usersMeta = const VerificationMeta('users');
  @override
  late final GeneratedColumn<String> users = GeneratedColumn<String>(
      'users', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _workspaceIdMeta =
      const VerificationMeta('workspaceId');
  @override
  late final GeneratedColumn<int> workspaceId = GeneratedColumn<int>(
      'workspace_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        hash,
        parentId,
        path,
        extension,
        fileName,
        createdAt,
        updatedAt,
        deletedAt,
        lastSyncedAt,
        mime,
        type,
        url,
        fileSize,
        tags,
        thumbnail,
        permissions,
        users,
        workspaceId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offlined_entries_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OfflinedEntriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    }
    if (data.containsKey('extension')) {
      context.handle(_extensionMeta,
          extension.isAcceptableOrUnknown(data['extension']!, _extensionMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('mime')) {
      context.handle(
          _mimeMeta, mime.isAcceptableOrUnknown(data['mime']!, _mimeMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('permissions')) {
      context.handle(
          _permissionsMeta,
          permissions.isAcceptableOrUnknown(
              data['permissions']!, _permissionsMeta));
    }
    if (data.containsKey('users')) {
      context.handle(
          _usersMeta, users.isAcceptableOrUnknown(data['users']!, _usersMeta));
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
          _workspaceIdMeta,
          workspaceId.isAcceptableOrUnknown(
              data['workspace_id']!, _workspaceIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflinedEntriesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflinedEntriesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path']),
      extension: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extension']),
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      mime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}thumbnail'])!,
      permissions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}permissions']),
      users: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}users']),
      workspaceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workspace_id'])!,
    );
  }

  @override
  $OfflinedEntriesTableTable createAlias(String alias) {
    return $OfflinedEntriesTableTable(attachedDatabase, alias);
  }
}

class OfflinedEntriesTableData extends DataClass
    implements Insertable<OfflinedEntriesTableData> {
  final int id;
  final String name;
  final String hash;
  final int? parentId;
  final String? path;
  final String? extension;
  final String fileName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final DateTime? lastSyncedAt;
  final String? mime;
  final String? type;
  final String? url;
  final int? fileSize;
  final String? tags;
  final bool thumbnail;
  final String? permissions;
  final String? users;
  final int workspaceId;
  const OfflinedEntriesTableData(
      {required this.id,
      required this.name,
      required this.hash,
      this.parentId,
      this.path,
      this.extension,
      required this.fileName,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.lastSyncedAt,
      this.mime,
      this.type,
      this.url,
      this.fileSize,
      this.tags,
      required this.thumbnail,
      this.permissions,
      this.users,
      required this.workspaceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['hash'] = Variable<String>(hash);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    if (!nullToAbsent || extension != null) {
      map['extension'] = Variable<String>(extension);
    }
    map['file_name'] = Variable<String>(fileName);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || mime != null) {
      map['mime'] = Variable<String>(mime);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<int>(fileSize);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['thumbnail'] = Variable<bool>(thumbnail);
    if (!nullToAbsent || permissions != null) {
      map['permissions'] = Variable<String>(permissions);
    }
    if (!nullToAbsent || users != null) {
      map['users'] = Variable<String>(users);
    }
    map['workspace_id'] = Variable<int>(workspaceId);
    return map;
  }

  OfflinedEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return OfflinedEntriesTableCompanion(
      id: Value(id),
      name: Value(name),
      hash: Value(hash),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      extension: extension == null && nullToAbsent
          ? const Value.absent()
          : Value(extension),
      fileName: Value(fileName),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      mime: mime == null && nullToAbsent ? const Value.absent() : Value(mime),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      thumbnail: Value(thumbnail),
      permissions: permissions == null && nullToAbsent
          ? const Value.absent()
          : Value(permissions),
      users:
          users == null && nullToAbsent ? const Value.absent() : Value(users),
      workspaceId: Value(workspaceId),
    );
  }

  factory OfflinedEntriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflinedEntriesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hash: serializer.fromJson<String>(json['hash']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      path: serializer.fromJson<String?>(json['path']),
      extension: serializer.fromJson<String?>(json['extension']),
      fileName: serializer.fromJson<String>(json['fileName']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      mime: serializer.fromJson<String?>(json['mime']),
      type: serializer.fromJson<String?>(json['type']),
      url: serializer.fromJson<String?>(json['url']),
      fileSize: serializer.fromJson<int?>(json['fileSize']),
      tags: serializer.fromJson<String?>(json['tags']),
      thumbnail: serializer.fromJson<bool>(json['thumbnail']),
      permissions: serializer.fromJson<String?>(json['permissions']),
      users: serializer.fromJson<String?>(json['users']),
      workspaceId: serializer.fromJson<int>(json['workspaceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'hash': serializer.toJson<String>(hash),
      'parentId': serializer.toJson<int?>(parentId),
      'path': serializer.toJson<String?>(path),
      'extension': serializer.toJson<String?>(extension),
      'fileName': serializer.toJson<String>(fileName),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'mime': serializer.toJson<String?>(mime),
      'type': serializer.toJson<String?>(type),
      'url': serializer.toJson<String?>(url),
      'fileSize': serializer.toJson<int?>(fileSize),
      'tags': serializer.toJson<String?>(tags),
      'thumbnail': serializer.toJson<bool>(thumbnail),
      'permissions': serializer.toJson<String?>(permissions),
      'users': serializer.toJson<String?>(users),
      'workspaceId': serializer.toJson<int>(workspaceId),
    };
  }

  OfflinedEntriesTableData copyWith(
          {int? id,
          String? name,
          String? hash,
          Value<int?> parentId = const Value.absent(),
          Value<String?> path = const Value.absent(),
          Value<String?> extension = const Value.absent(),
          String? fileName,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> mime = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<int?> fileSize = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          bool? thumbnail,
          Value<String?> permissions = const Value.absent(),
          Value<String?> users = const Value.absent(),
          int? workspaceId}) =>
      OfflinedEntriesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        hash: hash ?? this.hash,
        parentId: parentId.present ? parentId.value : this.parentId,
        path: path.present ? path.value : this.path,
        extension: extension.present ? extension.value : this.extension,
        fileName: fileName ?? this.fileName,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        mime: mime.present ? mime.value : this.mime,
        type: type.present ? type.value : this.type,
        url: url.present ? url.value : this.url,
        fileSize: fileSize.present ? fileSize.value : this.fileSize,
        tags: tags.present ? tags.value : this.tags,
        thumbnail: thumbnail ?? this.thumbnail,
        permissions: permissions.present ? permissions.value : this.permissions,
        users: users.present ? users.value : this.users,
        workspaceId: workspaceId ?? this.workspaceId,
      );
  @override
  String toString() {
    return (StringBuffer('OfflinedEntriesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hash: $hash, ')
          ..write('parentId: $parentId, ')
          ..write('path: $path, ')
          ..write('extension: $extension, ')
          ..write('fileName: $fileName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('mime: $mime, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('fileSize: $fileSize, ')
          ..write('tags: $tags, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('permissions: $permissions, ')
          ..write('users: $users, ')
          ..write('workspaceId: $workspaceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      hash,
      parentId,
      path,
      extension,
      fileName,
      createdAt,
      updatedAt,
      deletedAt,
      lastSyncedAt,
      mime,
      type,
      url,
      fileSize,
      tags,
      thumbnail,
      permissions,
      users,
      workspaceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflinedEntriesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.hash == this.hash &&
          other.parentId == this.parentId &&
          other.path == this.path &&
          other.extension == this.extension &&
          other.fileName == this.fileName &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.mime == this.mime &&
          other.type == this.type &&
          other.url == this.url &&
          other.fileSize == this.fileSize &&
          other.tags == this.tags &&
          other.thumbnail == this.thumbnail &&
          other.permissions == this.permissions &&
          other.users == this.users &&
          other.workspaceId == this.workspaceId);
}

class OfflinedEntriesTableCompanion
    extends UpdateCompanion<OfflinedEntriesTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> hash;
  final Value<int?> parentId;
  final Value<String?> path;
  final Value<String?> extension;
  final Value<String> fileName;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> mime;
  final Value<String?> type;
  final Value<String?> url;
  final Value<int?> fileSize;
  final Value<String?> tags;
  final Value<bool> thumbnail;
  final Value<String?> permissions;
  final Value<String?> users;
  final Value<int> workspaceId;
  const OfflinedEntriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hash = const Value.absent(),
    this.parentId = const Value.absent(),
    this.path = const Value.absent(),
    this.extension = const Value.absent(),
    this.fileName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.mime = const Value.absent(),
    this.type = const Value.absent(),
    this.url = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.tags = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.permissions = const Value.absent(),
    this.users = const Value.absent(),
    this.workspaceId = const Value.absent(),
  });
  OfflinedEntriesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String hash,
    this.parentId = const Value.absent(),
    this.path = const Value.absent(),
    this.extension = const Value.absent(),
    required String fileName,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.mime = const Value.absent(),
    this.type = const Value.absent(),
    this.url = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.tags = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.permissions = const Value.absent(),
    this.users = const Value.absent(),
    this.workspaceId = const Value.absent(),
  })  : name = Value(name),
        hash = Value(hash),
        fileName = Value(fileName);
  static Insertable<OfflinedEntriesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? hash,
    Expression<int>? parentId,
    Expression<String>? path,
    Expression<String>? extension,
    Expression<String>? fileName,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? mime,
    Expression<String>? type,
    Expression<String>? url,
    Expression<int>? fileSize,
    Expression<String>? tags,
    Expression<bool>? thumbnail,
    Expression<String>? permissions,
    Expression<String>? users,
    Expression<int>? workspaceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (hash != null) 'hash': hash,
      if (parentId != null) 'parent_id': parentId,
      if (path != null) 'path': path,
      if (extension != null) 'extension': extension,
      if (fileName != null) 'file_name': fileName,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (mime != null) 'mime': mime,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (fileSize != null) 'file_size': fileSize,
      if (tags != null) 'tags': tags,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (permissions != null) 'permissions': permissions,
      if (users != null) 'users': users,
      if (workspaceId != null) 'workspace_id': workspaceId,
    });
  }

  OfflinedEntriesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? hash,
      Value<int?>? parentId,
      Value<String?>? path,
      Value<String?>? extension,
      Value<String>? fileName,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? mime,
      Value<String?>? type,
      Value<String?>? url,
      Value<int?>? fileSize,
      Value<String?>? tags,
      Value<bool>? thumbnail,
      Value<String?>? permissions,
      Value<String?>? users,
      Value<int>? workspaceId}) {
    return OfflinedEntriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hash: hash ?? this.hash,
      parentId: parentId ?? this.parentId,
      path: path ?? this.path,
      extension: extension ?? this.extension,
      fileName: fileName ?? this.fileName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      mime: mime ?? this.mime,
      type: type ?? this.type,
      url: url ?? this.url,
      fileSize: fileSize ?? this.fileSize,
      tags: tags ?? this.tags,
      thumbnail: thumbnail ?? this.thumbnail,
      permissions: permissions ?? this.permissions,
      users: users ?? this.users,
      workspaceId: workspaceId ?? this.workspaceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (extension.present) {
      map['extension'] = Variable<String>(extension.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (mime.present) {
      map['mime'] = Variable<String>(mime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<bool>(thumbnail.value);
    }
    if (permissions.present) {
      map['permissions'] = Variable<String>(permissions.value);
    }
    if (users.present) {
      map['users'] = Variable<String>(users.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<int>(workspaceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflinedEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hash: $hash, ')
          ..write('parentId: $parentId, ')
          ..write('path: $path, ')
          ..write('extension: $extension, ')
          ..write('fileName: $fileName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('mime: $mime, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('fileSize: $fileSize, ')
          ..write('tags: $tags, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('permissions: $permissions, ')
          ..write('users: $users, ')
          ..write('workspaceId: $workspaceId')
          ..write(')'))
        .toString();
  }
}

class $ApiResponseCacheTableTable extends ApiResponseCacheTable
    with TableInfo<$ApiResponseCacheTableTable, ApiResponseCacheTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApiResponseCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<Uint8List> body = GeneratedColumn<Uint8List>(
      'body', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, url, body, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'api_response_cache_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ApiResponseCacheTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  ApiResponseCacheTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApiResponseCacheTableData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}body'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ApiResponseCacheTableTable createAlias(String alias) {
    return $ApiResponseCacheTableTable(attachedDatabase, alias);
  }
}

class ApiResponseCacheTableData extends DataClass
    implements Insertable<ApiResponseCacheTableData> {
  final String key;
  final String url;
  final Uint8List body;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ApiResponseCacheTableData(
      {required this.key,
      required this.url,
      required this.body,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['url'] = Variable<String>(url);
    map['body'] = Variable<Uint8List>(body);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ApiResponseCacheTableCompanion toCompanion(bool nullToAbsent) {
    return ApiResponseCacheTableCompanion(
      key: Value(key),
      url: Value(url),
      body: Value(body),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ApiResponseCacheTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ApiResponseCacheTableData(
      key: serializer.fromJson<String>(json['key']),
      url: serializer.fromJson<String>(json['url']),
      body: serializer.fromJson<Uint8List>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'url': serializer.toJson<String>(url),
      'body': serializer.toJson<Uint8List>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ApiResponseCacheTableData copyWith(
          {String? key,
          String? url,
          Uint8List? body,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ApiResponseCacheTableData(
        key: key ?? this.key,
        url: url ?? this.url,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ApiResponseCacheTableData(')
          ..write('key: $key, ')
          ..write('url: $url, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      key, url, $driftBlobEquality.hash(body), createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiResponseCacheTableData &&
          other.key == this.key &&
          other.url == this.url &&
          $driftBlobEquality.equals(other.body, this.body) &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ApiResponseCacheTableCompanion
    extends UpdateCompanion<ApiResponseCacheTableData> {
  final Value<String> key;
  final Value<String> url;
  final Value<Uint8List> body;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ApiResponseCacheTableCompanion({
    this.key = const Value.absent(),
    this.url = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ApiResponseCacheTableCompanion.insert({
    required String key,
    required String url,
    required Uint8List body,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        url = Value(url),
        body = Value(body),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ApiResponseCacheTableData> custom({
    Expression<String>? key,
    Expression<String>? url,
    Expression<Uint8List>? body,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (url != null) 'url': url,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ApiResponseCacheTableCompanion copyWith(
      {Value<String>? key,
      Value<String>? url,
      Value<Uint8List>? body,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ApiResponseCacheTableCompanion(
      key: key ?? this.key,
      url: url ?? this.url,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (body.present) {
      map['body'] = Variable<Uint8List>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApiResponseCacheTableCompanion(')
          ..write('key: $key, ')
          ..write('url: $url, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $OfflinedEntriesTableTable offlinedEntriesTable =
      $OfflinedEntriesTableTable(this);
  late final $ApiResponseCacheTableTable apiResponseCacheTable =
      $ApiResponseCacheTableTable(this);
  late final Index path =
      Index('path', 'CREATE INDEX path ON offlined_entries_table (path)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [offlinedEntriesTable, apiResponseCacheTable, path];
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'3d3a397d2ea952fc020fce0506793a5564e93530';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
