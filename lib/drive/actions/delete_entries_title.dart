import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/trash/delete_entries_forever_dialog.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteEntriesTitle extends ConsumerWidget {
  final List<FileEntry> entries;

  const DeleteEntriesTitle(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!entries.every((e) => e.permissions.delete) ||
        ref.activeRouteIs(AppRoute.sharedWithMe)) {
      return const SizedBox.shrink();
    }

    final driveApi = ref.read(driveApiProvider).requireValue;
    final inTrash = ref.activeRouteIs(AppRoute.trash);
    return ListTile(
      leading: const Icon(Icons.delete_outline),
      title: StyledText(inTrash ? 'Delete forever' : 'Remove'),
      onTap: () async {
        if (inTrash) {
          context.pop();
          showDeleteEntriesForeverDialog(context, entries);
          return;
        }

        try {
          await driveApi.deleteEntries(entries.map((e) => e.id).toList());
          context.showTextSnackBar(
            'Moved [one 1 item|other :count items] to trash',
            replacements: {'count': entries.length},
          );
        } on ApiClientException catch (e) {
          context.showErrorSnackBar(e.message);
        } finally {
          if (context.mounted) context.pop();
        }
      },
    );
  }
}
