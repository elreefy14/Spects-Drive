import 'dart:io';

import 'package:bedrive/bootstrap/preferences_provider.dart';
import 'package:bedrive/drive/transfers/models/download_transfer_task.dart';
import 'package:bedrive/drive/transfers/models/upload_transfer_task.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../drive/notifications/local_notifications_provider.dart';
import '../drive/notifications/notification_type.dart';
import '../drive/notifications/payloads/notification_payload.dart';
import '../drive/transfers/manager/transfers_manager_provider.dart';
import '../drive/transfers/models/transfer_queue_item.dart';
import '../drive/transfers/transfers_notification.dart';
import '../i18n/localization_provider.dart';

part '../.generated/providers/transfer_queue_provider.g.dart';

@Riverpod(keepAlive: true)
class TransferQueue extends _$TransferQueue {
  Future<List<String>> enqueueUploads(
    List<UploadTransferTask> tasks, {
    String? parentId,
  }) async {
    final newState = {...await future};
    final manager = ref.read(transfersManagerProvider);

    final transferItems = await manager.enqueueUploads(
      tasks,
      parentId: parentId,
    );
    for (var transfer in transferItems) {
      newState[transfer.id] = transfer;
    }
    state = AsyncData(newState);
    _updateNotification(TransferType.upload);

    return transferItems.map((e) => e.id).toList();
  }

  Future<List<String>> enqueueDownloads(
    List<DownloadTransferTask> tasks,
  ) async {
    final newState = {...await future};
    final manager = ref.read(transfersManagerProvider);

    final transfers = await manager.enqueueDownloads(tasks);
    for (var transfer in transfers) {
      newState[transfer.id] = transfer;
    }
    state = AsyncData(newState);
    _updateNotification(TransferType.download);

    return transfers.map((e) => e.id).toList();
  }

  resume(String id) async {
    final previousState = await future;
    final transfer = previousState[id];
    final manager = ref.read(transfersManagerProvider);

    if (transfer != null) {
      if (await manager.resume(transfer)) {
        previousState[id] = transfer.copyWith(
          status: TransferStatus.inProgress,
        );
        state = AsyncData(previousState);
        _updateNotification(transfer.type);
      }
    }
  }

  restart(String id) async {
    final previousState = await future;
    final transfer = previousState[id];
    final manager = ref.read(transfersManagerProvider);

    if (transfer != null) {
      final newTransfer = await manager.restart(transfer);
      if (newTransfer != null) {
        previousState.remove(id);
        previousState[newTransfer.id] = newTransfer;
        state = AsyncData(previousState);
      }
    }
  }

  pause(String id) async {
    final previousState = await future;
    final transfer = previousState[id];
    final manager = ref.read(transfersManagerProvider);

    if (transfer != null) {
      if (await manager.pause(transfer)) {
        previousState[id] = transfer.copyWith(status: TransferStatus.paused);
        state = AsyncData(previousState);
        _updateNotification(transfer.type);
      }
    }
  }

  Future<void> cancel(List<String> taskIds) async {
    final previousState = await future;
    final manager = ref.read(transfersManagerProvider);

    final transfers = previousState.values
        .where(
          (e) => taskIds.contains(e.id),
        )
        .toList();
    final transferIds = transfers.map((e) => e.id).toList();

    if (transfers.isNotEmpty) {
      previousState.removeWhere((key, value) => transferIds.contains(key));
      state = AsyncData(previousState);
      await manager.cancel(transferIds);
      _updateNotification(transfers.first.type);
    }
  }

  Future<bool> changeTaskStatus(
    String id,
    TransferStatus newStatus, {
    String? errorMessage,
  }) async {
    final previousState = await future;
    final transfer = previousState[id];
    if (transfer != null && transfer.status != newStatus) {
      previousState[id] = transfer.copyWith(
        status: newStatus,
        errorMessage: errorMessage,
      );
      state = AsyncData(previousState);
      _updateNotification(transfer.type);
      return true;
    }
    return false;
  }

  void markAsCompleted(String taskId) async {
    final transfer = (await future)[taskId];

    if (transfer == null ||
        !await changeTaskStatus(transfer.id, TransferStatus.completed)) {
      return;
    }

    // reload file entries from backend and update UI
    if (transfer.type == TransferType.upload) {
      ref.invalidate(fileEntriesProvider);
    }
  }

  markAsFailed(String id, String? errorMessage) async {
    changeTaskStatus(id, TransferStatus.error, errorMessage: errorMessage);
  }

  updateProgress(String id, int percent) async {
    final previousState = await future;
    final transfer = previousState[id];
    if (transfer != null && transfer.maybeUpdateProgress(percent)) {
      previousState[id] = transfer.copyWith();
      state = AsyncData(previousState);
      if (!Platform.isIOS) {
        _updateNotification(transfer.type);
      }
    }
  }

  clearAllCompleted() async {
    final manager = ref.read(transfersManagerProvider);
    final newState = {...await future};
    newState.removeWhere((_, t) => t.status == TransferStatus.completed);
    manager.clearCompleted();
    state = AsyncData(newState);
    for (var e in TransferType.values) {
      _updateNotification(e);
    }
  }

  remove(String id) async {
    final manager = ref.read(transfersManagerProvider);
    final newState = {...await future};
    newState.remove(id);
    manager.remove([id]);
    state = AsyncData(newState);
    for (var e in TransferType.values) {
      _updateNotification(e);
    }
  }

  _updateNotification(
    TransferType type, {
    bool hideIfAllCompleted = false,
  }) async {
    final sharedPrefs = ref.watch(preferencesProvider).requireValue;

    if (!(sharedPrefs.getBool(transferNotifId) ?? true)) {
      return;
    }

    final notifications = ref.read(localNotificationsProvider.notifier);
    final localizer = ref.read(localizationProvider);
    final localNotificationId = transferNotificationGroupId[type]!;

    final allTransfers = {...await future};

    List<TransferQueueItem> queue =
        allTransfers.values.where((e) => e.type == type).toList();
    List<TransferQueueItem> pending =
        queue.where((e) => e.status != TransferStatus.completed).toList();
    String payload =
        NotificationPayload(notifId: NotificationType.transferProgress)
            .toRawJson();

    // if no transfers in queue, hide notification
    if (queue.isEmpty || (hideIfAllCompleted && pending.isEmpty)) {
      notifications.cancel(localNotificationId);
      return;
    }

    TransferNotificationGroup group =
        TransferNotificationGroup.someStillInProgress;
    if (pending.isEmpty) {
      group = TransferNotificationGroup.allCompleted;
    } else if (pending.every((e) => e.status == TransferStatus.paused)) {
      group = TransferNotificationGroup.allPaused;
    } else if (pending.every((e) => e.status == TransferStatus.error)) {
      group = TransferNotificationGroup.allFailed;
    }

    final messageQueue = group == TransferNotificationGroup.someStillInProgress
        ? pending
        : queue;

    final (
      message,
      body,
      progress,
      displayName,
      count,
    ) = TransfersNotification.get(group, type, messageQueue);
    final translatedMessage = localizer.translate(message, {
      'name': displayName,
      'count': count,
    });
    notifications.show(
      translatedMessage,
      body: body,
      progress: progress,
      localId: localNotificationId,
      payload: payload,
    );
  }

  @override
  Future<Map<String, TransferQueueItem>> build() async {
    final manager = ref.read(transfersManagerProvider);

    final subscription = await manager.listenToUpdates(this);

    ref.onDispose(() {
      subscription.cancel();
    });

    for (var e in TransferType.values) {
      _updateNotification(e, hideIfAllCompleted: true);
    }

    return await manager.loadPersistedTransfers();
  }
}
