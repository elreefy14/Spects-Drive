import 'dart:io';

import 'package:bedrive/drive/preview/locally_stored_file_provider.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocallyStoredFileView extends ConsumerWidget {
  final FileEntry fileEntry;
  final Widget Function(double? progress) loading;
  final Widget? error;
  final Widget Function(File file)? child;
  final Widget Function(File? file)? childOrError;
  final Function(File? file)? onComplete;
  final bool download;

  const LocallyStoredFileView({
    required this.fileEntry,
    this.child,
    this.childOrError,
    required this.loading,
    this.error,
    this.download = false,
    this.onComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = locallyStoredFileProvider(
      fileEntry.toStable(),
      download: download,
    );

    if (onComplete != null) {
      ref.listen(provider, (previous, next) {
        final value = next.valueOrNull;
        if (value is LocallyStoredFileSuccess) {
          onComplete?.call(value.file);
        } else if (next is LocallyStoredFileError) {
          onComplete?.call(null);
        }
      });
    }

    final asyncValue = ref.watch(provider);
    final value = asyncValue.valueOrNull;

    if (value case LocallyStoredFileSuccess()) {
      return childOrError != null
          ? childOrError!(value.file)
          : child!(value.file);
    }

    if (asyncValue is AsyncLoading || value is LocallyStoredFileLoading) {
      final progress =
          (asyncValue.valueOrNull as LocallyStoredFileLoading?)?.progress;
      return loading(progress);
    }

    return childOrError != null ? childOrError!(null) : error!;
  }
}
