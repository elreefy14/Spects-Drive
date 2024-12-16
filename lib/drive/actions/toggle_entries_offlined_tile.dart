import 'package:bedrive/drive/offline/offlined_entries_controller.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ToggledEntriesOfflinedTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const ToggledEntriesOfflinedTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!entries.every((e) => e.permissions.download)) {
      return const SizedBox.shrink();
    }

    final offlinedEntryIds =
        ref.watch(offlinedEntriesControllerProvider).requireValue;
    final allOfflined = entries.every(
      (entry) => offlinedEntryIds.contains(entry.id),
    );
    final offlinedEntries =
        ref.watch(offlinedEntriesControllerProvider.notifier);
    return ListTile(
      leading: allOfflined
          ? const Icon(Icons.offline_pin_rounded, color: Colors.green)
          : const Icon(Icons.offline_pin_outlined),
      title: StyledText(
        allOfflined ? 'Available offline' : 'Make available offline',
      ),
      onTap: () async {
        if (allOfflined) {
          offlinedEntries.unoffline(entries);
          context.showTextSnackBar('Files will no longer be available offline');
        } else {
          offlinedEntries.makeAvailableOffline(entries);
          context.showTextSnackBar('Making files available offline');
        }
        context.pop();
      },
    );
  }
}
