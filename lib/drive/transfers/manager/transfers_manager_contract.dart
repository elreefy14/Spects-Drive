import 'dart:async';

import 'package:bedrive/drive/transfers/models/download_transfer_task.dart';
import 'package:bedrive/drive/transfers/models/upload_transfer_task.dart';

import '../../../http/api_client.dart';
import '../../../providers/transfer_queue_provider.dart';
import '../models/transfer_queue_item.dart';

abstract class TransfersManagerContract {
  abstract final ApiHttpClient apiClient;

  Future<Map<String, TransferQueueItem>> loadPersistedTransfers();

  Future<List<TransferQueueItem>> enqueueUploads(
    List<UploadTransferTask> tasks, {
    String? parentId,
  });

  Future<List<TransferQueueItem>> enqueueDownloads(
    List<DownloadTransferTask> tasks,
  );

  Future<void> download(
    DownloadTransferTask task, {
    void Function(int)? onProgress,
    void Function(bool)? onComplete,
  });

  Future<bool> pause(TransferQueueItem transfer);

  Future<bool> resume(TransferQueueItem transfer);

  Future<void> cancel(List<String> taskIds);

  Future<bool> hasTaskWithId(String taskId);

  Future<TransferQueueItem?> restart(TransferQueueItem transfer);

  Future<StreamSubscription> listenToUpdates(TransferQueue provider);

  void clearCompleted();

  Future<void> remove(List<String> taskIds);
}
