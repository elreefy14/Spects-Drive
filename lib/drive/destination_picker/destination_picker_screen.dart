import 'package:bedrive/drive/destination_picker/entry_move_type.dart';
import 'package:bedrive/drive/drive_pagination_params.dart';
import 'package:bedrive/drive/folders/create_folder_dialog.dart';
import 'package:bedrive/drive/illustrated_message.dart';
import 'package:bedrive/drive/layout/drive_screen_content.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/providers/files_entries_provider.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/ui/global_loading_indicator_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../drive_api_provider.dart';

class DestinationPickerScreen extends ConsumerWidget {
  final String destinationId;
  final List<FileEntry> targetEntries;
  final bool showMoveAction;

  const DestinationPickerScreen({
    required this.destinationId,
    required this.targetEntries,
    required this.showMoveAction,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionName =
        destinationId == '0' ? DriveSection.home : DriveSection.folder;
    // folderId is '0' when the user is at the root
    final provider = fileEntriesProvider(
      DrivePaginationParams(
        section: sectionName,
        folderId: destinationId == '0' ? null : destinationId,
      ),
    );
    final entries = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledText('Select destination'),
            StyledText(
              entries.valueOrNull?.folder?.name ?? '',
              size: 14,
              translate: false,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.create_new_folder_outlined),
            onPressed: () async {
              final fileEntry = await showDialog<FileEntry>(
                context: context,
                builder: (BuildContext context) => CreateFolderDialog(),
              );
              if (fileEntry != null) {
                ref.goToDestinationPickerScreen(
                  destinationId: fileEntry.id.toString(),
                  targetEntries: targetEntries,
                  showMoveAction: showMoveAction,
                );
              }
            },
          ),
        ],
      ),
      body: DriveScreenContent(
        uniqueId: sectionName,
        emptyStateWidget: const IllustratedMessage(
          title: 'This folder is empty',
          assetPath: 'assets/icons/add-files.svg',
        ),
        onLoadNextPage: () => ref.read(provider.notifier).loadNextPage(),
        onRefresh: () => ref.refresh(provider.future),
        entries: entries,
      ),
      persistentFooterButtons: [
        _MoveCopyButton(
          targetEntries: targetEntries,
          moveType: EntryMoveType.copy,
          destination: entries.valueOrNull?.folder,
        ),
        showMoveAction
            ? _MoveCopyButton(
                targetEntries: targetEntries,
                moveType: EntryMoveType.move,
                destination: entries.valueOrNull?.folder,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _MoveCopyButton extends HookConsumerWidget {
  final EntryMoveType moveType;
  final FileEntry? destination;
  final List<FileEntry> targetEntries;

  const _MoveCopyButton({
    required this.moveType,
    required this.destination,
    required this.targetEntries,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingIndicator = ref.read(globalLoadingIndicatorProvider.notifier);
    final driveApi = ref.watch(driveApiProvider).requireValue;
    final shouldDisableButton = destination == null ||
        !_canMoveEntriesTo(targetEntries, destination!, moveType);

    moveOrCopyEntries() async {
      if (!_canMoveEntriesTo(targetEntries, destination!, moveType)) {
        context.showErrorSnackBar(
          'You cannot move or copy a file to itself or any of its subfolders.',
        );
      } else {
        try {
          loadingIndicator.show(
            text: moveType == EntryMoveType.move ? 'Moving...' : 'Copying...',
          );

          await driveApi.moveEntries(
            moveType: moveType,
            entryIds: targetEntries.map((e) => e.id).toList(),
            destinationId: destination!.id,
          );

          loadingIndicator.hide();

          while (ref.activeRouteIs(AppRoute.destinationPicker)) {
            context.pop();
          }

          context.showTextSnackBar(
            moveType == EntryMoveType.move
                ? 'Moved [one 1 item|other :count items] to ":destination"'
                : 'Copied [one 1 item|other :count items] to ":destination"',
            replacements: {
              'count': targetEntries.length,
              'destination': destination!.name,
            },
          );
        } on ApiClientException catch (e) {
          context.showErrorSnackBar(e.message);
        } finally {
          loadingIndicator.hide();
        }
      }
    }

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: context.colorScheme.primary,
      ),
      onPressed: shouldDisableButton ? null : moveOrCopyEntries,
      child: StyledText(
        moveType == EntryMoveType.move ? 'MOVE HERE' : 'COPY HERE',
      ),
    );
  }

  bool _canMoveEntriesTo(
    List<FileEntry> targetEntries,
    FileEntry destination,
    EntryMoveType moveType,
  ) {
    if (destination.type != 'folder') {
      return false;
    }

    final destinationId = destination.id == 0 ? null : destination.id;

    // should not be able to move folder into it's
    // own child or same folder it's already in
    return targetEntries.every((entry) {
      // entry is already in this destination
      if (moveType == EntryMoveType.move && destinationId == entry.parentId) {
        return false;
      }

      // destination is a child of target
      if (destination.path == null ||
          entry.path == null ||
          destination.path!.startsWith(entry.path!)) {
        return false;
      }

      return true;
    });
  }
}
