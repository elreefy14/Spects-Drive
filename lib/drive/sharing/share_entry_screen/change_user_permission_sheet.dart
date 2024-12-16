import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/drive_entry_user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'entry_permission_selector.dart';

class ChangeUserPermissionSheet extends StatelessWidget {
  final DriveEntryUser fileEntryUser;

  const ChangeUserPermissionSheet({
    super.key,
    required this.fileEntryUser,
  });

  @override
  Widget build(BuildContext context) {
    final children = allEntryPermissions.values.map((permission) {
      final isSelected =
          fileEntryUser.permissions.primaryPermission == permission;
      return ListTile(
        selected: isSelected,
        leading: isSelected ? const Icon(Icons.check) : const SizedBox.shrink(),
        title: StyledText(permission.label),
        onTap: () => context.pop(isSelected ? null : permission),
      );
    }).toList();

    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(fileEntryUser.image!),
            ),
            title: StyledText(fileEntryUser.name, translate: false),
            subtitle: StyledText(fileEntryUser.email, translate: false),
          ),
        ),
        ...children,
      ],
    );
  }
}
