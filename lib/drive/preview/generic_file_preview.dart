import 'package:bedrive/drive/layout/entry_view/file_thumbnail.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';

class GenericFilePreview extends StatelessWidget {
  final FileEntry fileEntry;

  const GenericFilePreview(this.fileEntry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FileThumbnail(fileEntry, size: FileThumbnailSize.small),
                  const SizedBox(width: 12),
                  Flexible(
                      child: StyledText(
                    fileEntry.name,
                    translate: false,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              const StyledText('File preview not available.'),
            ],
          ),
        ),
      ),
    );
  }
}
