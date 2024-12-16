import 'package:bedrive/drive/preview/generic_file_preview.dart';
import 'package:bedrive/drive/preview/locally_stored_file_view.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PdfFilePreview extends ConsumerWidget {
  final FileEntry fileEntry;

  const PdfFilePreview(this.fileEntry, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LocallyStoredFileView(
      download: true,
      fileEntry: fileEntry,
      loading: (progress) => Center(
        child: CircularProgressIndicator(value: progress),
      ),
      error: GenericFilePreview(fileEntry),
      child: (file) => PDFView(
        filePath: file.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        fitEachPage: false,
      ),
    );
  }
}
