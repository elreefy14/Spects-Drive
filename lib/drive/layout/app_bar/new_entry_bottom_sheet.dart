import 'dart:io';

import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/folders/create_folder_dialog.dart';
import 'package:bedrive/drive/transfers/models/upload_transfer_task.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/ui/global_loading_indicator_provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class NewEntryBottomSheet extends ConsumerWidget {
  const NewEntryBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingIndicator = ref.read(globalLoadingIndicatorProvider.notifier);
    final driveApi = ref.watch(driveApiProvider).requireValue;

    Future<void> pickImageOrVideo(
      String type,
      ImageSource source,
    ) async {
      final pickedFile = type == 'image'
          ? await ImagePicker().pickImage(source: source)
          : await ImagePicker().pickVideo(source: source);

      if (pickedFile != null) {
        driveApi.uploadEntries(
          [
            UploadTransferTask(
              path: pickedFile.path,
              fileSize: await pickedFile.length(),
            ),
          ],
        );
        if (Platform.isIOS) {
          context.pushNamed(AppRoute.transfers.name);
        }
      }
    }

    List<Widget> children = [
      ListTile(
        leading: const Icon(Icons.create_new_folder_outlined),
        title: const StyledText('New folder'),
        onTap: () async {
          context.pop();
          showDialog(
            context: context,
            builder: (BuildContext context) => CreateFolderDialog(),
          );
        },
      ),
    ];

    // Photo gallery on iOS
    if (Platform.isIOS) {
      children.add(
        ListTile(
          leading: const Icon(Icons.photo_library_outlined),
          title: const StyledText('Upload image'),
          onTap: () async {
            await pickImageOrVideo('image', ImageSource.gallery);
            context.pop();
          },
        ),
      );
      children.add(
        ListTile(
          leading: const Icon(Icons.video_collection_outlined),
          title: const StyledText('Upload video'),
          onTap: () async {
            await pickImageOrVideo('video', ImageSource.gallery);
            context.pop();
          },
        ),
      );
    }

    // Pick file from file system
// First, import file_selector instead of file_picker

// Then modify your ListTile code:
    children.add(
      ListTile(
        leading: const Icon(Icons.upload_file),
        title: StyledText(Platform.isAndroid ? 'Upload files' : 'Browse'),
        onTap: () async {
          Future.delayed(const Duration(milliseconds: 300), () {
            loadingIndicator.show(text: 'Preparing to upload files');
          });

          // Use file_selector to pick files
          final List<XFile> files = await openFiles();

          loadingIndicator.hide();
          context.pop();

          if (files.isNotEmpty) {
            final filesToUpload = files.map((file) async {
              final fileSize = await file.length();
              return UploadTransferTask(
                path: file.path,
                fileSize: fileSize,
              );
            }).toList();

            // Wait for all file sizes to be calculated
            final tasks = await Future.wait(filesToUpload);

            driveApi.uploadEntries(tasks);
            if (Platform.isIOS) {
              context.pushNamed(AppRoute.transfers.name);
            }
          }
        },
      ),
    );
    // Take photo / video
    children.addAll(
      [
        ListTile(
          leading: const Icon(Icons.add_a_photo_outlined),
          title: const StyledText('Take photo'),
          onTap: () async {
            await pickImageOrVideo('image', ImageSource.camera);
            context.pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.video_call_outlined),
          title: const StyledText('Record video'),
          onTap: () async {
            await pickImageOrVideo('video', ImageSource.camera);
            context.pop();
          },
        ),
      ],
    );

    return ListView(
      shrinkWrap: true,
      children: children,
    );
  }
}
