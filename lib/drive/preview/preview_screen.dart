import 'package:bedrive/drive/actions/entry_actions_bottom_sheet.dart';
import 'package:bedrive/drive/preview/generic_file_preview.dart';
import 'package:bedrive/drive/preview/image_file_preview.dart';
import 'package:bedrive/drive/preview/office_file_preview.dart';
import 'package:bedrive/drive/preview/open_in_external_button.dart';
import 'package:bedrive/drive/preview/pdf_file_preview.dart';
import 'package:bedrive/drive/preview/text_file_preview.dart';
import 'package:bedrive/drive/preview/video_file_preview.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/providers/file_entry_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviewScreen extends ConsumerWidget {
  final FileEntry? fileEntry;
  final int entryId;

  const PreviewScreen({
    required this.fileEntry,
    required this.entryId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // show passed in entry while "asyncFileEntry" is loading. "asyncFileEntry" will
    // cause this page to rebuild with new data after changes are made to file entry

    final asyncFileEntry = ref.watch(fileEntryProvider(entryId));
    final entry = asyncFileEntry.valueOrNull ?? fileEntry;

    if (entry == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: StyledText(entry.name, translate: false),
        actions: [
          OpenInExternalAppButton(entry),
          _MoreOptionsButton(entry),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        color: context.colorScheme.surface,
        child: _getFilePreviewWidget(entry),
      ),
    );
  }

  Widget _getFilePreviewWidget(FileEntry entry) {
    if (entry.type == 'video' || entry.type == 'audio') {
      return VideoFilePreview(entry);
    } else if (entry.type == 'image') {
      return ImageFilePreview(entry);
    } else if (entry.type == 'pdf') {
      return PdfFilePreview(entry);
    } else if (['spreadsheet', 'powerPoint', 'word'].contains(entry.type)) {
      return OfficeFilePreview(entry);
    } else if (entry.type == 'text' && entry.mime != 'text/rtf') {
      return TextFilePreview(entry);
    } else {
      return GenericFilePreview(entry);
    }
  }
}

class _MoreOptionsButton extends StatelessWidget {
  final FileEntry fileEntry;

  const _MoreOptionsButton(this.fileEntry);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert_outlined),
      onPressed: () async {
        showEntryActionsBottomSheet(context, [fileEntry]);
      },
    );
  }
}
