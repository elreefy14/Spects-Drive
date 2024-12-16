import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/providers/file_entry_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../http/api_client_exception.dart';
import '../../../models/drive_entry_user.dart';
import '../../../models/file_entry.dart';
import '../../drive_api_provider.dart';
import 'email_chip_input.dart';
import 'entry_permission_selector.dart';
import 'entry_user_list.dart';

class ShareEntryScreen extends HookConsumerWidget {
  final FileEntry _fileEntry;

  const ShareEntryScreen(FileEntry fileEntry, {super.key})
      : _fileEntry = fileEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // show passed in entry while "asyncFileEntry" is loading. "asyncFileEntry" will
    // cause this page to rebuild with new data after changes are made to file entry
    final asyncFileEntry = ref.watch(fileEntryProvider(_fileEntry.id));
    final fileEntry = asyncFileEntry.valueOrNull ?? _fileEntry;

    final selectedPermission = useState(canViewEntryUserPermission);
    final isLoading = useState(false);
    final emails = useState<List<String>>([]);

    share() async {
      final driveApi = ref.read(driveApiProvider).requireValue;

      if (emails.value.isEmpty) {
        return ref.context.showErrorSnackBar(
          'Enter at least one email address to share with.',
        );
      }

      try {
        isLoading.value = true;
        await driveApi.shareEntry(
          entryId: fileEntry.id,
          emails: emails.value,
          permissions: selectedPermission.value.permissions,
        );
        emails.value = [];
        ref.context.showTextSnackBar('Person added.');
      } on ApiClientException catch (e) {
        ref.context.showErrorSnackBar(e.message);
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText(fileEntry.name, translate: false),
            StyledText(
              'Share ${fileEntry.type == 'folder' ? 'folder' : 'file'}',
              size: 14,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StyledText(
                  'Invite collaborators',
                  style: context.textTheme.titleMedium,
                ),
                EntryPermissionSelector(
                  selectedPermission: selectedPermission.value,
                  onSelected: (newPermission) {
                    selectedPermission.value = newPermission;
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            EmailChipInput(
              chips: emails.value,
              onChange: (value) => emails.value = value,
            ),
            const SizedBox(height: 30),
            StyledText(
              'Who has access',
              style: context.textTheme.titleMedium,
            ),
            EntryUsersList(
              fileEntry: fileEntry,
              onRefresh: () async => ref.refresh(
                fileEntryProvider(fileEntry.id),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: SizedBox(
          height: 52,
          child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: isLoading.value ? null : () => share(),
                child: const StyledText('Share'),
              )),
        ),
      ),
    );
  }
}
