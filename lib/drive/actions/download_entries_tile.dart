import 'package:bedrive/drive/transfers/models/download_transfer_task.dart';
import 'package:bedrive/drive/transfers/models/transfer_queue_item.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/providers/transfer_queue_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DownloadEntriesTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const DownloadEntriesTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!entries.every((e) => e.permissions.download)) {
      return const SizedBox.shrink();
    }

    final transfers = ref.read(transferQueueProvider.notifier);
    return ListTile(
      leading: const Icon(Icons.download_outlined),
      title: const StyledText('Download'),
      onTap: () async {
        transfers.enqueueDownloads(
          entries
              .map(
                (entry) => DownloadTransferTask(
                    entry: entry, type: TransferType.download),
              )
              .toList(),
        );
        context.pop();
      },
    );
  }
}
