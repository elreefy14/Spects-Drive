import 'package:bedrive/drive/layout/entry_view/file_thumbnail.dart';
import 'package:bedrive/drive/preview/generic_file_preview.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';

class ImageFilePreview extends StatelessWidget {
  final FileEntry fileEntry;

  const ImageFilePreview(this.fileEntry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ImageThumbnail(
        fileEntry,
        size: FileThumbnailSize.unbound,
        fit: BoxFit.contain,
        error: GenericFilePreview(fileEntry),
      ),
    );
  }
}
