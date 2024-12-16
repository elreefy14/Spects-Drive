import 'dart:io';

import 'package:bedrive/models/file_entry.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../.generated/drive/offline/offlined_entries_path_provider.g.dart';

@Riverpod(keepAlive: true)
class OfflinedEntriesPath extends _$OfflinedEntriesPath {
  String forEntry(BaseFileEntry entry) {
    final base = state.requireValue;
    return '$base/${entry.fileName}.${entry.extension}';
  }

  @override
  Future<String> build() async {
    final storageDir = await (Platform.isIOS
        ? getLibraryDirectory()
        : getApplicationSupportDirectory());
    final storagePath = '${storageDir.path}/offlined-files';

    await Directory(storagePath).create();

    return storagePath;
  }
}
