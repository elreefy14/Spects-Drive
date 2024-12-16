import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../http/api_client_exception.dart';
import '../../i18n/styled_text.dart';
import '../../models/file_entry.dart';
import '../drive_api_provider.dart';

Future<void> showRestoreFolderDialog(
  BuildContext context,
  FileEntry entry,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => _RestoreFolderDialog(entry),
  );
}

class _RestoreFolderDialog extends HookConsumerWidget {
  final FileEntry entry;

  const _RestoreFolderDialog(this.entry);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final driveApi = ref.read(driveApiProvider).requireValue;

    return AlertDialog(
      title: const StyledText('This folder is in your trash'),
      content:
          const StyledText('To view this folder, restore it from the trash.'),
      actions: <Widget>[
        TextButton(
          onPressed: isLoading.value
              ? null
              : () {
                  if (context.mounted) context.pop();
                },
          child: const StyledText('Cancel'),
        ),
        FilledButton(
          onPressed: isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  try {
                    await driveApi.restoreEntries([entry.id]);
                    context.showTextSnackBar(
                      'Restored [one 1 item|other :count items]',
                      replacements: {'count': 1},
                    );
                    if (context.mounted) context.pop();
                  } on ApiClientException catch (e) {
                    context.showErrorSnackBar(e.message);
                  } finally {
                    isLoading.value = false;
                  }
                },
          child: const StyledText('Restore'),
        ),
      ],
    );
  }
}
