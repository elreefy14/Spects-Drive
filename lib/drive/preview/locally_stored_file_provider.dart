import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bedrive/drive/offline/offlined_entries_path_provider.dart';
import 'package:bedrive/drive/transfers/manager/transfers_manager_provider.dart';
import 'package:bedrive/drive/transfers/models/download_transfer_task.dart';
import 'package:bedrive/drive/transfers/models/transfer_queue_item.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../.generated/drive/preview/locally_stored_file_provider.g.dart';

sealed class LocallyStoredFileResult {
  const LocallyStoredFileResult();
}

final class LocallyStoredFileLoading extends LocallyStoredFileResult {
  final double? progress;

  const LocallyStoredFileLoading(this.progress);
}

final class LocallyStoredFileError extends LocallyStoredFileResult {
  const LocallyStoredFileError();
}

final class LocallyStoredFileSuccess extends LocallyStoredFileResult {
  final File file;

  const LocallyStoredFileSuccess(this.file);
}

@riverpod
Stream<LocallyStoredFileResult> locallyStoredFile(
  LocallyStoredFileRef ref,
  StableFileEntry entry, {
  bool download = false,
}) {
  final transfers = ref.read(transfersManagerProvider);
  final taskId = Random().nextInt(1 << 32).toString();
  final streamController = StreamController<LocallyStoredFileResult>();
  final offlinedEntryFile =
      File(ref.read(offlinedEntriesPathProvider.notifier).forEntry(entry));

  ref.onDispose(() {
    transfers.cancel([taskId]);
    streamController.close();
  });

  // can't use await because riverpod will not generate StreamProvider
  (getTemporaryDirectory()).then((tempDir) async {
    final dir = Directory('${tempDir.path}/open-in-external-cache');
    await dir.create();

    final locallyStoredEntry = File(
      '${dir.path}/${basenameWithoutExtension(entry.name)}.${entry.extension}',
    );

    if (offlinedEntryFile.existsSync() &&
        offlinedEntryFile.lengthSync() == entry.fileSize) {
      streamController.add(LocallyStoredFileSuccess(offlinedEntryFile));
      streamController.close();
    } else if (locallyStoredEntry.existsSync() &&
        locallyStoredEntry.lengthSync() == entry.fileSize) {
      streamController.add(LocallyStoredFileSuccess(locallyStoredEntry));
      streamController.close();
    } else if (download) {
      transfers.download(
        DownloadTransferTask(
          id: taskId,
          entry: entry,
          path: locallyStoredEntry.path,
          type: TransferType.download,
        ),
        onProgress: (int progress) {
          streamController.add(
            // show indeterminate spinner while progress is 0
            LocallyStoredFileLoading(progress <= 0 ? null : progress / 100),
          );
        },
        onComplete: (isSuccess) {
          if (isSuccess &&
              locallyStoredEntry.existsSync() &&
              locallyStoredEntry.lengthSync() == entry.fileSize) {
            streamController.add(LocallyStoredFileSuccess(locallyStoredEntry));
          } else {
            streamController.add(const LocallyStoredFileError());
          }
          streamController.close();
        },
      );
    } else {
      streamController.add(const LocallyStoredFileError());
      streamController.close();
    }
  });

  return streamController.stream;
}
