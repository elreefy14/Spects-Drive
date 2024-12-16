import 'package:bedrive/auth/auth_state_provider.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/drive_entry_user.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../auth/user.dart';
import '../../../http/api_client_exception.dart';
import '../../../i18n/localization_provider.dart';
import '../../../models/file_entry.dart';
import '../../drive_api_provider.dart';
import 'change_user_permission_sheet.dart';

class EntryUsersList extends StatelessWidget {
  final FileEntry fileEntry;
  final AsyncCallback onRefresh;

  const EntryUsersList({
    required this.fileEntry,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          children: fileEntry.users
              .map(
                (user) => _EntryUserListTile(
                  fileEntry: fileEntry,
                  fileEntryUser: user,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _EntryUserListTile extends HookConsumerWidget {
  final FileEntry fileEntry;
  final DriveEntryUser fileEntryUser;

  const _EntryUserListTile({
    required this.fileEntry,
    required this.fileEntryUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final httpClient = ref.read(apiClientProvider).requireValue;
    final driveApi = ref.read(driveApiProvider).requireValue;
    final isLoading = useState(false);

    showPermissionSelector() async {
      final selectedPermission =
          await showModalBottomSheet<EntryUserPermission>(
        context: context,
        builder: (_) => ChangeUserPermissionSheet(fileEntryUser: fileEntryUser),
      );
      if (selectedPermission != null) {
        try {
          isLoading.value = true;
          await driveApi.changeSharedEntryPermission(
            entryId: fileEntry.id,
            userId: fileEntryUser.id,
            permissions: selectedPermission.permissions,
          );
          context.showTextSnackBar('Updated user permissions');
        } on ApiClientException catch (e) {
          context.showErrorSnackBar(e.message);
        } finally {
          isLoading.value = false;
        }
      }
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: fileEntryUser.image != null
            ? NetworkImage(
                httpClient.buildUri(fileEntryUser.image!).toString(),
              )
            : null,
        child: fileEntryUser.image == null
            ? Text(
                fileEntryUser.name[0].toUpperCase(),
              )
            : null,
      ),
      title: StyledText(fileEntryUser.name, translate: false),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledText(fileEntryUser.email, translate: false),
          const SizedBox(height: 4),
          CurrentPermissionText(
            fileEntry: fileEntry,
            fileEntryUser: fileEntryUser,
          ),
        ],
      ),
      trailing: EntryUserTileTrailingAction(
        fileEntry: fileEntry,
        fileEntryUser: fileEntryUser,
      ),
      contentPadding: const EdgeInsets.all(0),
      isThreeLine: true,
      onTap: !isLoading.value && _canChangePermission(fileEntry, fileEntryUser)
          ? () => showPermissionSelector()
          : null,
    );
  }
}

class CurrentPermissionText extends StatelessWidget {
  final FileEntry fileEntry;
  final DriveEntryUser fileEntryUser;

  const CurrentPermissionText({
    super.key,
    required this.fileEntry,
    required this.fileEntryUser,
  });

  @override
  Widget build(BuildContext context) {
    if (fileEntryUser.ownsEntry) {
      return const StyledText('Owner');
    }

    final style = _canChangePermission(fileEntry, fileEntryUser)
        ? TextStyle(color: context.colorScheme.primary)
        : null;

    return StyledText(
      fileEntryUser.permissions.primaryPermission.label,
      style: style,
    );
  }
}

class EntryUserTileTrailingAction extends HookConsumerWidget {
  final FileEntry fileEntry;
  final DriveEntryUser fileEntryUser;

  const EntryUserTileTrailingAction({
    super.key,
    required this.fileEntry,
    required this.fileEntryUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final User? currentUser = ref.watch(authStateProvider).requireValue;

    if (fileEntryUser.ownsEntry || fileEntryUser.id == currentUser?.id) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: const Icon(Icons.close_outlined),
      tooltip: localizer.translate('Remove user'),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (_) => RemoveUserDialog(
            fileEntry: fileEntry,
            fileEntryUser: fileEntryUser,
          ),
        );
      },
    );
  }
}

class RemoveUserDialog extends HookConsumerWidget {
  final FileEntry fileEntry;
  final DriveEntryUser fileEntryUser;

  const RemoveUserDialog({
    required this.fileEntry,
    required this.fileEntryUser,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final driveApi = ref.read(driveApiProvider).requireValue;

    return AlertDialog(
      title: const StyledText('Remove User'),
      content: const StyledText(
        'Are you sure you want to remove this user?',
        singleLine: false,
      ),
      actions: [
        TextButton(
          child: const StyledText('Cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.colorScheme.error,
              ),
            ),
            child: const StyledText('Remove'),
            onPressed: () async {
              try {
                isLoading.value = true;
                await driveApi.unshareEntry([fileEntry.id], fileEntryUser.id);
                context.showTextSnackBar('User removed');
                context.pop();
              } on ApiClientException catch (e) {
                context.showErrorSnackBar(e.message);
              } finally {
                isLoading.value = false;
              }
            }),
      ],
    );
  }
}

_canChangePermission(FileEntry fileEntry, DriveEntryUser fileEntryUser) {
  return fileEntry.permissions.update && !fileEntryUser.ownsEntry;
}
