import 'package:bedrive/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/file_entry.dart';
import '../drive_api_provider.dart';

part '../../.generated/drive/folders/folder_path_provider.g.dart';

@riverpod
Future<List<FileEntry>> folderPath(FolderPathRef ref, String folderId) {
  final api = ref.read(driveApiProvider).requireValue;
  ref.cacheResults();
  return api.fetchFolderPath(folderId);
}
