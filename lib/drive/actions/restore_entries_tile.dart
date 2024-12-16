import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestoreEntriesTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const RestoreEntriesTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driveApi = ref.read(driveApiProvider).requireValue;
    final inTrash = ref.activeRouteIs(AppRoute.trash);

    if (!inTrash || !entries.every((e) => e.permissions.delete)) {
      return const SizedBox.shrink();
    }

    return ListTile(
      leading: const Icon(Icons.restore_outlined),
      title: const StyledText('Restore'),
      onTap: () async {
        try {
          await driveApi.restoreEntries(entries.map((e) => e.id).toList());
          context.showTextSnackBar(
            'Restored [one 1 item|other :count items]',
            replacements: {'count': entries.length},
          );
          if (context.mounted) context.pop();
        } on ApiClientException catch (e) {
          context.showErrorSnackBar(e.message);
        }
      },
    );
  }
}
