import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/layout/entry_view/drive_item_tap_handlers.dart';
import 'package:bedrive/drive/layout/entry_view/file_thumbnail.dart';
import 'package:bedrive/drive/offline/offlined_entries_controller.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/utils/format_file_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'drive_item_trailing_action.dart';

class EntryListView extends ConsumerWidget {
  final List<FileEntry> entries;

  const EntryListView({
    required this.entries,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: const EdgeInsets.all(0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => _ListItem(entries[index]),
          childCount: entries.length,
        ),
      ),
    );
  }
}

class _ListItem extends ConsumerWidget with DriveItemTapHandlers {
  final FileEntry fileEntry;

  const _ListItem(this.fileEntry);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDisabled = shouldDisable(ref, fileEntry);
    final isSelected = ref.watch(
      driveStateProvider.select(
        (s) =>
            s.selectedEntries.contains(fileEntry.id) &&
            s.driveMode != DriveMode.destinationPicker,
      ),
    );

    return ListTile(
      enabled: !isDisabled,
      leading: Container(
        width: 40,
        alignment: Alignment.center,
        child: FileThumbnail(fileEntry, size: FileThumbnailSize.small),
      ),
      title: Text(fileEntry.name),
      subtitle: _Subtitle(fileEntry: fileEntry),
      onTap: () => onTap(ref, fileEntry),
      onLongPress: () => onLongPress(ref, fileEntry),
      selected: isSelected && !isDisabled,
      trailing: DriveItemTrailingAction(fileEntry),
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
    );
  }
}

class _Subtitle extends ConsumerWidget {
  final FileEntry fileEntry;

  const _Subtitle({required this.fileEntry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShared = fileEntry.users.length > 1;
    bool isOfflined = ref.watch(
      offlinedEntriesControllerProvider.select(
        (s) => s.requireValue.contains(fileEntry.id),
      ),
    );
    final children = <Widget>[];

    if (isShared) {
      children.add(const Icon(Icons.people_alt_sharp, size: 13));
      children.add(const SizedBox(width: 2));
    }
    if (fileEntry.isStarred) {
      children.add(const Icon(Icons.star_sharp, size: 13));
      children.add(const SizedBox(width: 2));
    }
    if (isOfflined) {
      children.add(const Icon(Icons.offline_pin, size: 12));
      children.add(const SizedBox(width: 2));
    }
    if (isShared || fileEntry.isStarred || isOfflined) {
      children.add(const SizedBox(width: 5));
    }

    final parts = <String>[];
    if (fileEntry.createdAt != null) {
      parts.add(DateFormat('MMM dd yyyy').format(fileEntry.createdAt!));
      parts.add(String.fromCharCode(0x00B7));
    }
    parts.add(formatFileSize(fileEntry.fileSize ?? 0));

    children.add(
      StyledText(parts.join(' '), translate: false, size: 13),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
