import 'transfer_progress.dart';

enum TransferType {
  upload,
  download,
  offline,
}

enum TransferStatus {
  waiting,
  paused,
  inProgress,
  completed,
  error,
}

class TransferQueueItem {
  final String displayName;
  final String id;
  final int sizeInBytes;
  final TransferProgress progress;
  final TransferType type;
  final TransferStatus status;
  final String? errorMessage;
  int? _lastProgressUpdateTime;

  TransferQueueItem({
    required this.displayName,
    required this.id,
    required this.sizeInBytes,
    required this.progress,
    required this.type,
    required this.status,
    this.errorMessage,
  });

  bool maybeUpdateProgress(int newPercentage) {
    // update on first and last call or if 350 ms passed since last update
    final shouldUpdate = _lastProgressUpdateTime == null ||
        newPercentage == 100 ||
        (newPercentage != progress.percentage &&
            DateTime.now().millisecondsSinceEpoch - _lastProgressUpdateTime! >
                350);

    if (shouldUpdate) {
      progress.percentage = newPercentage;
      _lastProgressUpdateTime = DateTime.now().millisecondsSinceEpoch;
    }

    return shouldUpdate;
  }

  TransferQueueItem copyWith({
    String? displayName,
    String? id,
    int? sizeInBytes,
    TransferProgress? progress,
    TransferType? type,
    TransferStatus? status,
    String? errorMessage,
  }) {
    return TransferQueueItem(
      displayName: displayName ?? this.displayName,
      id: id ?? this.id,
      sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      progress: progress ?? this.progress,
      type: type ?? this.type,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
