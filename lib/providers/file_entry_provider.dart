import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../drive/drive_api_provider.dart';

part '../.generated/providers/file_entry_provider.g.dart';

@riverpod
Future<FileEntry> fileEntry(FileEntryRef ref, int entryId) async {
  final driveApi = ref.watch(driveApiProvider).requireValue;
  ref.cacheResults();
  return await driveApi.fetchFileEntry(entryId);
}
