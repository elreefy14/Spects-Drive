import 'package:bedrive/auth/auth_state_provider.dart';
import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemoveSharedEntriesTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const RemoveSharedEntriesTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authStateProvider).requireValue;
    if (!ref.activeRouteIs(AppRoute.sharedWithMe)) {
      return const SizedBox.shrink();
    }

    final driveApi = ref.read(driveApiProvider).requireValue;

    return ListTile(
      leading: const Icon(Icons.delete_outline),
      title: const StyledText('Remove'),
      onTap: () async {
        try {
          await driveApi.unshareEntry(
            entries.map((e) => e.id).toList(),
            currentUser!.id,
          );
          context.showTextSnackBar(
            'Removed [one 1 item|other {count} items]',
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
