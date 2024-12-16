import 'package:bedrive/drive/actions/rename_entry/rename_entry_dialog.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../i18n/styled_text.dart';
import '../../../models/file_entry.dart';
import '../../../router_provider.dart';

class RenameEntryTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const RenameEntryTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (entries.length > 1 ||
        !entries.every((e) => e.permissions.update) ||
        ref.activeRouteIs(AppRoute.trash)) {
      return const SizedBox.shrink();
    }

    return ListTile(
      leading: const Icon(Icons.drive_file_rename_outline_outlined),
      title: const StyledText('Rename'),
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) => RenameEntryDialog(entries[0]),
        );
        context.pop();
      },
    );
  }
}
