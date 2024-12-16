import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ToggleEntriesStarredTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const ToggleEntriesStarredTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driveApi = ref.read(driveApiProvider).requireValue;
    final allStarred = entries.every((e) => e.isStarred);
    return ListTile(
      leading: allStarred
          ? const Icon(Icons.star_outline, color: Colors.orange)
          : const Icon(Icons.star_outline),
      title: StyledText(allStarred ? 'Remove from starred' : 'Add to starred'),
      onTap: () async {
        try {
          if (entries[0].isStarred) {
            await driveApi.unstarEntries(entries.map((e) => e.id).toList());
            context.showTextSnackBar(
              'Removed star from [one 1 item|other :count items]',
              replacements: {'count': entries.length},
            );
          } else {
            await driveApi.starEntries(entries.map((e) => e.id).toList());
            context.showTextSnackBar(
              'Starred [one 1 item|other :count items]',
              replacements: {'count': entries.length},
            );
          }
        } on ApiClientException catch (e) {
          context.showErrorSnackBar(e.message);
        } finally {
          if (context.mounted) context.pop();
        }
      },
    );
  }
}
