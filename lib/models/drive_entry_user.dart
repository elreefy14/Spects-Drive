import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part '../.generated/models/drive_entry_user.freezed.dart';
part '../.generated/models/drive_entry_user.g.dart';

@freezed
class DriveEntryUser with _$DriveEntryUser {
  const DriveEntryUser._();

  factory DriveEntryUser({
    required int id,
    required String email,
    required String name,
    String? image,
    @JsonKey(name: 'owns_entry') required bool ownsEntry,
    @JsonKey(name: 'entry_permissions')
    required EntryUserPermissions permissions,
  }) = _DriveEntryUser;

  factory DriveEntryUser.fromJson(Map<String, dynamic> json) =>
      _$DriveEntryUserFromJson(json);

  String toRawJson() => jsonEncode(toJson());
}

class EntryUserPermission {
  final String key;
  final String label;
  final Map<String, bool> permissions;

  EntryUserPermission({
    required this.key,
    required this.label,
    required this.permissions,
  });
}

EntryUserPermission canViewEntryUserPermission = EntryUserPermission(
  key: 'view',
  label: 'Can view',
  permissions: {
    'view': true,
  },
);

EntryUserPermission canDownloadEntryUserPermission = EntryUserPermission(
  key: 'download',
  label: 'Can download',
  permissions: {
    'view': true,
    'download': true,
  },
);

EntryUserPermission canEditEntryUserPermission = EntryUserPermission(
  key: 'edit',
  label: 'Can edit',
  permissions: {
    'view': true,
    'edit': true,
    'download': true,
  },
);

class EntryUserPermissions {
  final bool canView;
  final bool canEdit;
  final bool canDownload;

  EntryUserPermissions({
    required this.canView,
    required this.canEdit,
    required this.canDownload,
  });

  factory EntryUserPermissions.fromJson(dynamic value) {
    if (value == null || value is List) {
      return EntryUserPermissions(
        canEdit: false,
        canView: false,
        canDownload: false,
      );
    }

    return EntryUserPermissions(
      canEdit: value['edit'] ?? false,
      canView: value['view'] ?? false,
      canDownload: value['download'] ?? false,
    );
  }

  EntryUserPermission get primaryPermission {
    if (canEdit) {
      return canEditEntryUserPermission;
    } else if (canDownload) {
      return canDownloadEntryUserPermission;
    } else {
      return canViewEntryUserPermission;
    }
  }

  Map<String, dynamic> toJson() => {
        'edit': canEdit,
        'view': canView,
        'download': canDownload,
      };
}
