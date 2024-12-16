import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/trash/restore_folder_dialog.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/file_entry.dart';

mixin DriveItemTapHandlers {
  shouldDisable(WidgetRef ref, FileEntry fileEntry) {
    final isDestinationPicker = ref.watch(
      driveStateProvider.select(
        (s) => s.driveMode == DriveMode.destinationPicker,
      ),
    );

    if (!isDestinationPicker) {
      return false;
    }

    // in destination picker, disable files and folders that user can't update
    return fileEntry.type != 'folder' || !fileEntry.permissions.update;
  }

  onTap(WidgetRef ref, FileEntry fileEntry) async {
    final router = ref.read(goRouterProvider);
    final isDestinationPicker = ref.watch(
      driveStateProvider.select(
        (s) => s.driveMode == DriveMode.destinationPicker,
      ),
    );
    final isInSelectionMode = ref.watch(
      driveStateProvider.select((s) => s.selectedEntries.isNotEmpty),
    );

    if (isDestinationPicker) {
      if (fileEntry.type == 'folder') {
        final data = router.location.extra as Map<String, dynamic>;
        ref.goToDestinationPickerScreen(
          destinationId: fileEntry.id.toString(),
          targetEntries: data['targetEntries'] as List<FileEntry>,
          showMoveAction: data['showMoveAction'] as bool,
        );
      }
    } else if (isInSelectionMode) {
      ref.read(driveStateProvider.notifier).toggleEntry(fileEntry.id);
    } else if (fileEntry.type == 'folder') {
      if (ref.activeRouteIs(AppRoute.trash)) {
        showRestoreFolderDialog(ref.context, fileEntry);
      } else {
        ref.context.pushNamed(
          AppRoute.folder.name,
          pathParameters: {'folderId': fileEntry.id.toString()},
          extra: fileEntry,
        );
      }
    } else {
      ref.context.pushNamed(
        AppRoute.preview.name,
        pathParameters: {'entryId': fileEntry.id.toString()},
        extra: fileEntry,
      );
    }
  }

  onLongPress(WidgetRef ref, FileEntry fileEntry) {
    final isDestinationPicker = ref.watch(
      driveStateProvider.select(
        (s) => s.driveMode == DriveMode.destinationPicker,
      ),
    );
    if (!isDestinationPicker) {
      ref.read(driveStateProvider.notifier).toggleEntry(fileEntry.id);
    }
  }
}
