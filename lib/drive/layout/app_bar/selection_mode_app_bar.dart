import 'package:bedrive/drive/actions/entry_actions_bottom_sheet.dart';
import 'package:bedrive/drive/actions/move_copy_tile.dart';
import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/i18n/localization_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/models/paginated_file_entries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionModeAppBar extends ConsumerWidget {
  final AsyncValue<PaginatedFileEntries> entries;

  const SelectionModeAppBar(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final selectedEntryIds = ref.watch(
      driveStateProvider.select((s) => s.selectedEntries),
    );
    final allEntries = entries.valueOrNull?.data ?? [];
    final selectedEntries = allEntries
        .where((entry) => selectedEntryIds.contains(entry.id))
        .toList();

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          ref.read(driveStateProvider.notifier).deselectAllEntries();
        },
      ),
      title: StyledText(
        ':count selected',
        replacements: {'count': selectedEntryIds.length},
        weight: FontWeight.normal,
        size: 18,
      ),
      actions: [
        _MoveButton(selectedEntries),
        IconButton(
            icon: const Icon(Icons.select_all_outlined),
            tooltip: localizer.translate('Select all'),
            onPressed: () async {
              final ids = allEntries.map((entry) => entry.id).toList();
              ref.read(driveStateProvider.notifier).selectMultipleEntries(ids);
            }),
        IconButton(
            icon: const Icon(Icons.more_vert_outlined),
            onPressed: () async {
              return showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext _) {
                  return EntryActionsBottomSheet(selectedEntries);
                },
              );
            }),
      ],
    );
  }
}

class _MoveButton extends ConsumerWidget with MoveCopyAction {
  final List<FileEntry> entries;

  const _MoveButton(this.entries);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    return IconButton(
      icon: const Icon(Icons.drive_file_move_outlined),
      tooltip: localizer.translate('Move / copy'),
      onPressed: () {
        performAction(ref, entries);
      },
    );
  }
}
