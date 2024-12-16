import '../../utils/format_file_size.dart';
import 'models/transfer_queue_item.dart';

const transferNotifId = 'T01';

// used for having one notification per group and updating it when
// status changes, instead of show a new notification each time
const transferNotificationGroupId = {
  TransferType.download: 59658458,
  TransferType.upload: 19648471,
  TransferType.offline: 193148874,
};

enum TransferNotificationGroup {
  allCompleted,
  allPaused,
  allFailed,
  someStillInProgress,
}

class TransfersNotification {
  static final messages = {
    TransferNotificationGroup.allCompleted: {
      TransferType.download: 'Downloaded [one ":name"|other :count files]',
      TransferType.upload: 'Uploaded [one ":name"|other :count files]',
      TransferType.offline: 'Offlined [one ":name"|other :count files]',
    },
    TransferNotificationGroup.allPaused: {
      TransferType.download: 'Paused [one ":name"|other :count files] download',
      TransferType.upload: 'Paused [one ":name"|other :count files] upload',
      TransferType.offline: 'Paused [one ":name"|other :count files] offlining',
    },
    TransferNotificationGroup.allFailed: {
      TransferType.download:
          'Failed to download [one ":name"|other :count files]',
      TransferType.upload: 'Failed to upload [one ":name"|other :count files]',
      TransferType.offline:
          'Failed to offline [one ":name"|other :count files]',
    },
    TransferNotificationGroup.someStillInProgress: {
      TransferType.download: 'Downloading [one ":name"|other :count files]',
      TransferType.upload: 'Uploading [one ":name"|other :count files]',
      TransferType.offline: 'Offlining [one ":name"|other :count files]',
    }
  };

  static final allCompletedMessages = {
    TransferType.download: 'Downloaded [one ":name"|other :count files]',
    TransferType.upload: 'Uploaded [one ":name"|other :count files]',
    TransferType.offline: 'Offlined [one ":name"|other :count files]',
  };

  static final someStillInProgressMessages = {
    TransferType.download: 'Downloading [one ":name"|other :count files]',
    TransferType.upload: 'Uploading [one ":name"|other :count files]',
    TransferType.offline: 'Offlining [one ":name"|other :count files]',
  };

  static final allFailedMessages = {
    TransferType.download:
        'Failed to download [one ":name"|other :count files]',
    TransferType.upload: 'Failed to upload [one ":name"|other :count files]',
    TransferType.offline: 'Failed to offline [one ":name"|other :count files]',
  };

  static get(TransferNotificationGroup group, TransferType type,
      List<TransferQueueItem> transfers) {
    final message = messages[group]![type]!;
    String? body;
    int? progress;

    if (group == TransferNotificationGroup.allPaused ||
        group == TransferNotificationGroup.someStillInProgress) {
      final (percent, sizeLeft) = calculateProgress(transfers);
      body = sizeLeft;
      progress = percent;
    }

    return (
      message,
      body,
      progress,
      transfers.first.displayName,
      transfers.length
    );
  }

  static calculateProgress(List<TransferQueueItem> transfers) {
    final sizeLeft = formatFileSize(transfers.fold(
        0, (dynamic prev, curr) => prev + curr.progress.bytesLeft));
    final progress = transfers
        .fold(
            0,
            (dynamic prev, curr) =>
                (prev + curr.progress.percentage) / transfers.length)
        .floor();
    return (progress, sizeLeft);
  }
}
