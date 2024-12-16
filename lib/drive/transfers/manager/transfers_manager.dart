import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:background_downloader/background_downloader.dart';
import 'package:bedrive/drive/transfers/models/download_transfer_task.dart';
import 'package:bedrive/drive/transfers/models/upload_transfer_task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../http/api_client.dart';
import '../../../http/api_client_exception.dart';
import '../../../providers/transfer_queue_provider.dart';
import '../models/transfer_progress.dart';
import '../models/transfer_queue_item.dart';
import 'transfers_manager_contract.dart';

part '../../../.generated/drive/transfers/manager/transfers_manager.freezed.dart';
part '../../../.generated/drive/transfers/manager/transfers_manager.g.dart';

enum TaskGroup {
  // enqueued download or upload that will appear in transfers screen
  enqueued,
  // download that is not shown in transfers screen, e.g. local download for preview
  awaited,
}

class TransfersManager implements TransfersManagerContract {
  @override
  final ApiHttpClient apiClient;

  TransfersManager(this.apiClient);

  @override
  Future<List<TransferQueueItem>> enqueueUploads(
    List<UploadTransferTask> tasks, {
    String? parentId,
  }) async {
    final managerTasks = tasks.map((t) async {
      final (baseDirectory, directory, filename) =
          await Task.split(filePath: t.path);

      final extra = {'disk': 'uploads'};
      if (parentId != null) {
        extra['parentId'] = parentId;
      }

      final task = UploadTask(
        displayName: filename,
        url: apiClient.buildUri('file-entries').toString(),
        headers: {'Accept': 'application/json', ...apiClient.authHeaders},
        baseDirectory: baseDirectory,
        directory: directory,
        filename: filename,
        httpRequestMethod: 'POST',
        updates: Updates.statusAndProgress,
        metaData: TransferManagerMetadata.jsonFromUploadTask(t),
        fields: extra,
        group: TaskGroup.enqueued.name,
      );

      if (await FileDownloader().enqueue(task)) {
        return taskToTransferQueueItem(
          type: TransferType.upload,
          task: task,
          taskStatus: TaskStatus.enqueued,
        );
      }

      return null;
    });

    return (await Future.wait(managerTasks.toList()))
        .whereType<TransferQueueItem>()
        .toList();
  }

  @override
  Future<List<TransferQueueItem>> enqueueDownloads(
    List<DownloadTransferTask> tasks,
  ) async {
    final managerTasks = tasks.map((e) async {
      BaseDirectory baseDirectory = BaseDirectory.applicationDocuments;
      String directory = '';
      String? fileName;

      if (e.path != null) {
        final (baseDir, dir, name) = await Task.split(filePath: e.path);
        baseDirectory = baseDir;
        directory = dir;
        fileName = name;
      }

      final task = DownloadTask(
        displayName: e.entry.name,
        taskId: e.id,
        url: apiClient
            .buildUri('file-entries/download/${e.entry.hash}')
            .toString(),
        headers: apiClient.authHeaders,
        updates: Updates.statusAndProgress,
        metaData: TransferManagerMetadata.jsonFromDownloadTask(e),
        baseDirectory: baseDirectory,
        directory: directory,
        filename: fileName ?? e.entry.name,
        group: TaskGroup.enqueued.name,
      );

      if (await FileDownloader().enqueue(task)) {
        return taskToTransferQueueItem(
          task: task,
          taskStatus: TaskStatus.enqueued,
          type: e.type,
        );
      }

      return null;
    });

    return (await Future.wait(managerTasks.toList()))
        .whereType<TransferQueueItem>()
        .toList();
  }

  @override
  Future<void> download(
    transferTask, {
    onProgress,
    onComplete,
  }) async {
    final (baseDirectory, directory, _) = await Task.split(
      filePath: transferTask.path,
    );

    final task = DownloadTask(
      displayName: transferTask.entry.name,
      taskId: transferTask.id,
      url: apiClient
          .buildUri('file-entries/download/${transferTask.entry.hash}')
          .toString(),
      headers: apiClient.authHeaders,
      filename: transferTask.entry.name,
      metaData: TransferManagerMetadata.jsonFromDownloadTask(transferTask),
      baseDirectory: baseDirectory,
      directory: directory,
      group: TaskGroup.awaited.name,
      allowPause: false,
      requiresWiFi: true,
      priority: 1,
      retries: 0,
    );

    await FileDownloader().download(
      task,
      onProgress: (progress) {
        onProgress?.call((progress * 100).floor());
      },
      onStatus: (status) {
        if (status.isFinalState) {
          remove([task.taskId]);
          onComplete?.call(status == TaskStatus.complete);
        }
      },
    );
  }

  @override
  Future<TransferQueueItem?> restart(TransferQueueItem transfer) async {
    final record = await FileDownloader().database.recordForId(transfer.id);
    if (record != null) {
      final newTask = record.task.copyWith();
      await FileDownloader().cancelTaskWithId(transfer.id);
      await FileDownloader().database.deleteRecordsWithIds([transfer.id]);
      if (await FileDownloader().enqueue(newTask)) {
        return taskToTransferQueueItem(
          task: newTask,
          taskStatus: TaskStatus.enqueued,
          type: transfer.type,
        );
      }
    }

    return null;
  }

  @override
  Future<bool> pause(TransferQueueItem transfer) async {
    switch (transfer.type) {
      case TransferType.download || TransferType.offline:
        final task = await FileDownloader().taskForId(transfer.id);
        if (task != null) {
          return await FileDownloader().pause(task as DownloadTask);
        }
        return false;
      case TransferType.upload:
        return await FileDownloader().cancelTaskWithId(transfer.id);
    }
  }

  @override
  Future<bool> resume(TransferQueueItem transfer) async {
    switch (transfer.type) {
      case TransferType.download || TransferType.offline:
        final task = await FileDownloader().taskForId(transfer.id);
        if (task != null) {
          return await FileDownloader().resume(task as DownloadTask);
        }
        return false;
      case TransferType.upload:
        return await restart(transfer) != null;
    }
  }

  @override
  Future<void> cancel(List<String> taskIds) async {
    final canceled = await FileDownloader().cancelTasksWithIds(taskIds);
    if (canceled) {
      await remove(taskIds);
    }
  }

  @override
  Future<bool> hasTaskWithId(String taskId) async {
    return await FileDownloader().taskForId(taskId) != null;
  }

  @override
  Future<Map<String, TransferQueueItem>> loadPersistedTransfers() async {
    final records = (await FileDownloader().database.allRecords()).where(
      (t) => t.group == TaskGroup.enqueued.name,
    );

    return Map.fromEntries(
      records.map(
        (record) {
          final metadata = TransferManagerMetadata.fromRawJson(
            record.task.metaData,
          );
          return MapEntry(
            record.task.taskId,
            taskToTransferQueueItem(
              task: record.task,
              type: metadata.transferType,
              taskStatus: record.status,
            ),
          );
        },
      ),
    );
  }

  @override
  Future<void> clearCompleted() async {
    final taskIds = (await FileDownloader().database.allRecords())
        .where((record) => record.status == TaskStatus.complete)
        .map((record) => record.task.taskId);
    FileDownloader().database.deleteRecordsWithIds(taskIds);
  }

  @override
  Future<void> remove(List<String> taskIds) async {
    await FileDownloader().database.deleteRecordsWithIds(taskIds);
  }

  @override
  Future<StreamSubscription> listenToUpdates(TransferQueue provider) async {
    final subscription = FileDownloader().updates.listen((update) async {
      final taskId = update.task.taskId;

      if (update.task.group == TaskGroup.awaited.name) {
        return;
      }

      switch (update) {
        case TaskStatusUpdate():
          switch (update.status) {
            case TaskStatus.enqueued:
              provider.changeTaskStatus(taskId, TransferStatus.waiting);
            case TaskStatus.running:
              provider.changeTaskStatus(taskId, TransferStatus.inProgress);
            case TaskStatus.paused || TaskStatus.waitingToRetry:
              provider.changeTaskStatus(taskId, TransferStatus.paused);
            case TaskStatus.complete:
              provider.markAsCompleted(taskId);
              final metadata = TransferManagerMetadata.fromRawJson(
                update.task.metaData,
              );
              if (metadata.transferType == TransferType.download) {
                await _makeDownloadPubliclyAvailable(
                  update.task as DownloadTask,
                );
              }
            case TaskStatus.failed ||
                  TaskStatus.notFound ||
                  TaskStatus.canceled:
              provider.markAsFailed(
                taskId,
                errorMessageFromResponseBody(update.responseBody),
              );
              provider.cancel([taskId]);
          }
        case TaskProgressUpdate():
          provider.updateProgress(taskId, (update.progress * 100).floor());
      }
    });

    await FileDownloader().trackTasks();
    await FileDownloader().resumeFromBackground();

    return subscription;
  }

  TransferQueueItem taskToTransferQueueItem({
    required Task task,
    required TaskStatus taskStatus,
    required TransferType type,
  }) {
    // map status of transfer
    final status = switch (taskStatus) {
      TaskStatus.enqueued ||
      TaskStatus.waitingToRetry =>
        TransferStatus.waiting,
      TaskStatus.running => TransferStatus.inProgress,
      TaskStatus.complete => TransferStatus.completed,
      TaskStatus.notFound ||
      TaskStatus.failed ||
      TaskStatus.canceled =>
        TransferStatus.error,
      TaskStatus.paused => TransferStatus.paused,
    };

    final metadata = TransferManagerMetadata.fromRawJson(task.metaData);
    return TransferQueueItem(
      id: task.taskId,
      displayName: task.displayName.isNotEmpty ? task.displayName : '',
      status: status,
      sizeInBytes: metadata.fileSize,
      type: type,
      progress: TransferProgress(metadata.fileSize),
    );
  }

  String? errorMessageFromResponseBody(String? responseBody) {
    if (ApiClientException.isBackendErrorResponse(responseBody)) {
      return ApiClientException.fromResponseBody(responseBody ?? '', 422)
          .message;
    }
    return null;
  }

  Future<void> _makeDownloadPubliclyAvailable(DownloadTask task) async {
    final metadata = TransferManagerMetadata.fromRawJson(task.metaData);

    // make images and videos available in gallery on iOs and Android
    if (metadata.type == 'image' || metadata.type == 'video') {
      await FileDownloader().moveToSharedStorage(
        task,
        metadata.type == 'image' ? SharedStorage.images : SharedStorage.video,
      );
      // move downloads on android only, on iOS "applicationDocuments" directory will be visible via file explorer
    } else if (Platform.isAndroid) {
      await FileDownloader().moveToSharedStorage(
        task,
        SharedStorage.downloads,
      );
    }
  }
}

@freezed
class TransferManagerMetadata with _$TransferManagerMetadata {
  const TransferManagerMetadata._();

  factory TransferManagerMetadata({
    required TransferType transferType,
    required int fileSize,
    String? mime,
    String? type,
  }) = _TransferManagerMetadata;

  static String jsonFromDownloadTask(DownloadTransferTask task) {
    final metadata = TransferManagerMetadata(
      transferType: task.type,
      fileSize: task.entry.fileSize ?? 0,
      type: task.entry.type ?? '',
      mime: task.entry.mime,
    );

    return jsonEncode(metadata.toJson());
  }

  static String jsonFromUploadTask(UploadTransferTask task) {
    final metadata = TransferManagerMetadata(
      transferType: TransferType.upload,
      fileSize: task.fileSize,
    );

    return jsonEncode(metadata.toJson());
  }

  factory TransferManagerMetadata.fromJson(Map<String, dynamic> json) =>
      _$TransferManagerMetadataFromJson(json);

  factory TransferManagerMetadata.fromRawJson(String str) =>
      TransferManagerMetadata.fromJson(json.decode(str));
}
