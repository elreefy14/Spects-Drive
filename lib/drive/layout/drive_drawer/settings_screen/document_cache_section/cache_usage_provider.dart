import 'dart:io';

import 'package:bedrive/utils/format_file_size.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../.generated/drive/layout/drive_drawer/settings_screen/document_cache_section/cache_usage_provider.g.dart';

@riverpod
class CacheUsage extends _$CacheUsage {
  void clearCache() async {
    final tempDir = await getTemporaryDirectory();
    tempDir.listSync().forEach((e) => e.deleteSync(recursive: true));
    ref.invalidateSelf();
  }

  @override
  Future<String> build() async {
    final tempDir = await getTemporaryDirectory();
    int totalSize = 0;
    if (tempDir.existsSync()) {
      tempDir
          .listSync(recursive: true, followLinks: false)
          .forEach((FileSystemEntity entity) {
        if (entity is File) {
          totalSize += entity.lengthSync();
        }
      });
    }
    return formatFileSize(totalSize);
  }
}
