import 'dart:math';

import 'package:bedrive/drive/destination_picker/entry_move_type.dart';
import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/folders/folder_path_provider.dart';
import 'package:bedrive/drive/sharing/shareable_link_screen/shareable_link.dart';
import 'package:bedrive/drive/transfers/models/upload_transfer_task.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/models/paginated_file_entries.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:bedrive/providers/transfer_queue_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/file_entry.dart';
import '../providers/file_entry_provider.dart';
import 'offline/offlined_entries_controller.dart';

part '../.generated/drive/drive_api_provider.g.dart';

@Riverpod(keepAlive: true)
Future<DriveApi> driveApi(
  DriveApiRef ref,
) async {
  final apiClient = await ref.read(apiClientProvider.future);
  final queue = ref.watch(transferQueueProvider.notifier);
  return DriveApi(apiClient, queue, ref);
}

class DriveApi {
  final DriveApiRef _ref;
  final ApiHttpClient _apiClient;
  final TransferQueue _queue;

  DriveApi(this._apiClient, this._queue, this._ref);

  Future<FileEntry> fetchFileEntry(int id) async {
    final response = await _apiClient.get(
      'drive/file-entries/$id/model',
      options: ApiClientOptions(cacheResponse: true),
    );
    return FileEntry.fromJson(response['fileEntry']);
  }

  Future<PaginatedFileEntries> fetchEntries(
    DrivePaginationParams params,
  ) async {
    if (params.section == DriveSection.offline) {
      final offlinedEntries =
          _ref.read(offlinedEntriesControllerProvider).requireValue;
      if (offlinedEntries.isEmpty) {
        return emptyPaginatedFileEntries;
      }

      final from = (params.page - 1) * drivePageSize;
      final to = min(offlinedEntries.length, from + drivePageSize);

      params = params.copyWith(
        entryIds: offlinedEntries.getRange(from, to).toList(),
      );
    }

    try {
      final response = await _apiClient.get(
        'drive/file-entries',
        queryParams: params.toMap(),
        options: ApiClientOptions(cacheResponse: true),
      );
      return PaginatedFileEntries.fromJson(response);
    } on ApiClientException catch (e) {
      // if there's no network connection, try to load from offlined entries db for these params
      if (e.type == ApiClientExceptionType.network) {
        final offlineEntries = await _ref
            .read(offlinedEntriesControllerProvider.notifier)
            .maybeLoadEntries(params);
        if (offlineEntries != null) {
          return offlineEntries;
        }
      }
      rethrow;
    }
  }

  Future<PaginatedFileEntries> fetchAllFolderChildren(FileEntry folder) async {
    final response = await _apiClient.get('drive/file-entries', queryParams: {
      'section': DriveSection.allChildren,
      'folderId': folder.id.toString(),
    });

    return PaginatedFileEntries.fromJson(response);
  }

  Future<String> fetchFileContent(FileEntry entry) async {
    final response = await _apiClient.get(
      entry.url!,
      headers: {'Accept': 'text/plain'},
    );
    return response;
  }

  Future<List<FileEntry>> fetchFolderPath(String folderId) async {
    final response = await _apiClient.get(
      'folders/$folderId/path',
      options: ApiClientOptions(cacheResponse: true),
    );
    return response['path']
        .map<FileEntry>((entry) => FileEntry.fromJson(entry))
        .toList();
  }

  Future<List<String>> uploadEntries(List<UploadTransferTask> tasks) {
    final parentId = _ref.read(driveStateProvider).activeFolderId;
    return _queue.enqueueUploads(
      tasks,
      parentId: parentId?.toString(),
    );
  }

  Future<ShareableLink?> fetchShareableLink(int entryId) async {
    final response = await _apiClient.get(
      'file-entries/$entryId/shareable-link',
      options: ApiClientOptions(cacheResponse: true),
    );
    return response['link'] != null
        ? ShareableLink.fromJson(response['link'])
        : null;
  }

  Future<void> createShareableLink(
      int entryId, Map<String, dynamic> payload) async {
    await _apiClient.post('file-entries/$entryId/shareable-link', payload);
  }

  Future<void> updateShareableLink(
    int entryId,
    Map<String, dynamic> payload,
  ) async {
    await _apiClient.put('file-entries/$entryId/shareable-link', payload);
  }

  Future<void> deleteShareableLink(int entryId) async {
    await _apiClient.delete('file-entries/$entryId/shareable-link');
  }

  Future<void> starEntries(List<int> entryIds) async {
    await _apiClient.post(
      'file-entries/star',
      {'entryIds': entryIds},
    );
    _invalidateEntryProviders();
  }

  Future<void> unstarEntries(List<int> entryIds) async {
    await _apiClient.post(
      'file-entries/unstar',
      {'entryIds': entryIds},
    );
    _invalidateEntryProviders();
  }

  Future<void> deleteEntries(List<int> entryIds, {bool? deleteForever}) async {
    await _apiClient.post('file-entries/delete', {
      'entryIds': entryIds,
      'deleteForever': deleteForever != null && deleteForever ? true : false,
    });
    _invalidateEntryProviders();
  }

  Future<void> shareEntry({
    required int entryId,
    required List<String> emails,
    required Map<String, bool> permissions,
  }) async {
    await _apiClient.post('file-entries/$entryId/share', {
      'emails': emails,
      'permissions': permissions,
    });
    _invalidateEntryProviders();
  }

  Future<void> unshareEntry(List<int> entryIds, int userId) async {
    await _apiClient.post('file-entries/${entryIds.join(',')}/unshare', {
      'userId': userId,
    });
    _invalidateEntryProviders();
  }

  Future<void> changeSharedEntryPermission({
    required int entryId,
    required int userId,
    required Map<String, bool> permissions,
  }) async {
    await _apiClient.put('file-entries/$entryId/change-permissions', {
      'userId': userId,
      'permissions': permissions,
    });
    _invalidateEntryProviders();
  }

  Future<void> restoreEntries(List<int> entryIds) async {
    await _apiClient.post('file-entries/restore', {
      'entryIds': entryIds,
    });
    _invalidateEntryProviders();
  }

  Future<FileEntry> createFolder({required String name}) async {
    final parentId = _ref.read(driveStateProvider).activeFolderId;
    final response = await _apiClient.post(
      'folders',
      {'name': name, 'parentId': parentId},
    );
    final fileEntry = FileEntry.fromJson(response['folder']);
    _invalidateEntryProviders();
    return fileEntry;
  }

  Future<void> moveEntries({
    required EntryMoveType moveType,
    required List<int> entryIds,
    required int destinationId,
  }) async {
    await _apiClient.post(
      moveType == EntryMoveType.move
          ? 'file-entries/move'
          : 'file-entries/duplicate',
      {
        'entryIds': entryIds,
        'destinationId': destinationId == 0 ? null : destinationId.toString(),
      },
    );
    _invalidateEntryProviders();
  }

  Future<void> renameEntry({required int id, required String newName}) async {
    await _apiClient.put(
      'file-entries/$id',
      {'name': newName},
    );
    _invalidateEntryProviders();
  }

  _invalidateEntryProviders() {
    _ref.invalidate(fileEntriesProvider);
    _ref.invalidate(fileEntryProvider);
    _ref.invalidate(folderPathProvider);
    //_ref.invalidate(spaceUsageProvider);
    _ref.read(driveStateProvider.notifier).deselectAllEntries();
  }
}
