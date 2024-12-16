import 'package:bedrive/drive/actions/entry_actions_bottom_sheet.dart';
import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DriveItemTrailingAction extends ConsumerWidget {
  final FileEntry fileEntry;

  const DriveItemTrailingAction(
    this.fileEntry, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inSelectMode = ref.watch(
      driveStateProvider.select((s) => s.selectedEntries.isNotEmpty),
    );
    final isDestinationPicker = ref.watch(
      driveStateProvider.select(
        (s) => s.driveMode == DriveMode.destinationPicker,
      ),
    );

    if (isDestinationPicker) {
      return const SizedBox.shrink();
    }

    final isSelected = ref.watch(
      driveStateProvider.select(
        (s) => s.selectedEntries.contains(fileEntry.id),
      ),
    );

    if (inSelectMode) {
      return Checkbox(
        value: isSelected,
        onChanged: (_) {
          ref.read(driveStateProvider.notifier).toggleEntry(fileEntry.id);
        },
      );
    }

    return IconButton(
      icon: const Icon(Icons.more_vert_rounded),
      visualDensity: VisualDensity.compact,
      onPressed: () {
        showEntryActionsBottomSheet(context, [fileEntry]);
      },
    );
  }
}
