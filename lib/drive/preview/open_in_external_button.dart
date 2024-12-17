import 'dart:io';

import 'package:bedrive/drive/preview/locally_stored_file_view.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:open_file/open_file.dart';

class OpenInExternalAppButton extends StatelessWidget {
  final FileEntry fileEntry;

  const OpenInExternalAppButton(this.fileEntry, {super.key});

  @override

  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.open_in_new_outlined),
      onPressed: () async {
        final localFile = await showDialog<dynamic>(
          context: context,
          builder: (_) => _LoadingIndicatorDialog(fileEntry),
        );

        // dialog was dismissed before download completed fully
        if (localFile == null) {
          return;
        }

        if (localFile == false) {
          context.showErrorSnackBar('Could not download file.');
          return;
        }

        try {
          // Create a file URI
          final uri = Uri.file((localFile as File).path);

          // Check if we can launch the file
          if (await canLaunchUrl(uri)) {
            // Launch the file with the appropriate app
            await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
          } else {
            context.showTextSnackBar(
              'No installed application can open this file',
            );
          }
        } catch (e) {
          context.showTextSnackBar(
            'Could not open the file',
          );
        }
      },
    );
  }
}

class _LoadingIndicatorDialog extends ConsumerWidget {
  final FileEntry fileEntry;

  const _LoadingIndicatorDialog(this.fileEntry);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.90,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              LocallyStoredFileView(
                download: true,
                fileEntry: fileEntry,
                onComplete: (file) => context.pop(file ?? false),
                loading: (progress) {
                  if (progress == null || progress <= 0) {
                    return const StyledText('Downloading file...');
                  }

                  return StyledText(
                    'Downloading file... :percent%',
                    replacements: {
                      'percent': (progress * 100).toInt().toString(),
                    },
                  );
                },
                childOrError: (_) => const StyledText('Downloading file...'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
