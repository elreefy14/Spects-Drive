import 'package:bedrive/drive/offline/offlined_entries_controller.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../http/api_client_exception.dart';
import '../../i18n/styled_text.dart';
import '../../models/file_entry.dart';
import '../drive_api_provider.dart';

Future<void> showDeleteEntriesForeverDialog(
  BuildContext context,
  List<FileEntry> entries,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => _DeleteEntriesForeverDialog(entries),
  );
}

class _DeleteEntriesForeverDialog extends HookConsumerWidget {
  final List<FileEntry> entries;

  const _DeleteEntriesForeverDialog(this.entries);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final driveApi = ref.read(driveApiProvider).requireValue;
    final offlinedEntries = ref.read(
      offlinedEntriesControllerProvider.notifier,
    );

    final message = entries.length == 1
        ? StyledText(
            "‘:name‘ will be deleted forever and you won't be able to restore it.",
            replacements: {'name': entries[0].name},
            singleLine: false,
          )
        : StyledText(
            ":count items will be deleted forever and you won't be able to restore them.",
            replacements: {'count': entries.length},
            singleLine: false,
          );

    return AlertDialog(
      title: const StyledText('Delete forever?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[message],
        ),
      ),
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
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.colorScheme.error,
            ),
          ),
          onPressed: isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  try {
                    await driveApi.deleteEntries(
                      entries.map((e) => e.id).toList(),
                      deleteForever: true,
                    );
                    offlinedEntries.unoffline(entries);
                    context.showTextSnackBar(
                      'Permanently deleted [one 1 item|other :count items]',
                      replacements: {'count': entries.length},
                    );
                  } on ApiClientException catch (e) {
                    context.showErrorSnackBar(e.message);
                  } finally {
                    isLoading.value = false;
                    if (context.mounted) context.pop();
                  }
                },
          child: const StyledText('Delete forever'),
        ),
      ],
    );
  }
}
