import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../i18n/localization_provider.dart';
import '../../../i18n/styled_text.dart';
import '../../../providers/transfer_queue_provider.dart';
import '../../../utils/format_file_size.dart';
import '../models/transfer_queue_item.dart';

class TransfersScreenListItem extends ConsumerWidget {
  final TransferQueueItem transfer;

  const TransfersScreenListItem(this.transfer, {super.key});

  toggleTransfer(WidgetRef ref) {
    final transfers = ref.read(transferQueueProvider.notifier);
    if (transfer.status == TransferStatus.inProgress) {
      transfers.pause(transfer.id);
    } else if (transfer.status == TransferStatus.paused) {
      transfers.resume(transfer.id);
    } else if (transfer.status == TransferStatus.error) {
      transfers.restart(transfer.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20, right: 10),
      onTap: transfer.status == TransferStatus.completed
          ? null
          : () => toggleTransfer(ref),
      leading: Container(
        width: 40,
        alignment: Alignment.center,
        child: ProgressIndicator(transfer),
      ),
      title: Text(transfer.displayName),
      subtitle: TransferStatusMessage(transfer),
      trailing: IconButton(
        icon: const Icon(Icons.close_outlined),
        onPressed: () {
          ref.read(transferQueueProvider.notifier).cancel([transfer.id]);
        },
      ),
    );
  }
}

class TransferStatusMessage extends ConsumerWidget {
  final TransferQueueItem transfer;

  const TransferStatusMessage(this.transfer, {super.key});

  @override
  build(BuildContext context, WidgetRef ref) {
    switch (transfer.status) {
      case TransferStatus.waiting:
        return const StyledText('Waiting...');
      case TransferStatus.paused:
        return const StyledText('Paused');
      case TransferStatus.inProgress:
        if (transfer.progress.bytesLeft == 0) {
          return const StyledText('Processing...');
        }
        return StyledText(':bytes left', replacements: {
          'bytes': formatFileSize(transfer.progress.bytesLeft)
        });
      case TransferStatus.completed:
        return const StyledText('Completed');
      case TransferStatus.error:
        final defaultMessage =
            ref.read(localizationProvider).translate('Error. Tap to retry');
        String msg = transfer.errorMessage != null
            ? transfer.errorMessage!
            : defaultMessage;
        return Text(msg);
    }
  }
}

class ProgressIndicator extends StatelessWidget {
  final TransferQueueItem transfer;

  const ProgressIndicator(this.transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    Color color = transfer.status == TransferStatus.error
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).primaryColor;

    IconData icon = switch (transfer.status) {
      TransferStatus.inProgress ||
      TransferStatus.waiting =>
        Icons.pause_outlined,
      TransferStatus.paused => Icons.play_arrow,
      TransferStatus.completed => Icons.check,
      TransferStatus.error => Icons.error_outlined,
    };

    return SizedBox(
      width: 26,
      height: 26,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: transfer.status == TransferStatus.completed
                ? 100
                : (transfer.progress.percentage / 100),
            backgroundColor: color.withAlpha(100),
            valueColor: AlwaysStoppedAnimation(color),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 14,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
