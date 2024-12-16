import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../i18n/styled_text.dart';
import '../../../models/drive_entry_user.dart';

Map<String, EntryUserPermission> allEntryPermissions = {
  canViewEntryUserPermission.key: canViewEntryUserPermission,
  canDownloadEntryUserPermission.key: canDownloadEntryUserPermission,
  canEditEntryUserPermission.key: canEditEntryUserPermission,
};

class EntryPermissionSelector extends StatelessWidget {
  final EntryUserPermission selectedPermission;
  final Function(EntryUserPermission value) onSelected;

  const EntryPermissionSelector({
    required this.selectedPermission,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return PopupMenuButton<EntryUserPermission>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return allEntryPermissions.values.map((permission) {
          return PopupMenuItem<EntryUserPermission>(
            value: permission,
            child: Text(
              permission.label,
              style: TextStyle(
                color: selectedPermission == permission ? primaryColor : null,
              ),
            ),
          );
        }).toList();
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: StyledText(
          allEntryPermissions[selectedPermission.key]?.label ?? 'Can view',
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
