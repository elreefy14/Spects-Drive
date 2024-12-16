import 'package:bedrive/drive/actions/copy_to_own_drive_tile.dart';
import 'package:bedrive/drive/actions/delete_entries_title.dart';
import 'package:bedrive/drive/actions/download_entries_tile.dart';
import 'package:bedrive/drive/actions/move_copy_tile.dart';
import 'package:bedrive/drive/actions/preview_entry_title.dart';
import 'package:bedrive/drive/actions/remove_shared_entries_tile.dart';
import 'package:bedrive/drive/actions/rename_entry/rename_entry_tile.dart';
import 'package:bedrive/drive/actions/restore_entries_tile.dart';
import 'package:bedrive/drive/actions/share_entry_title.dart';
import 'package:bedrive/drive/actions/shareable_link_title.dart';
import 'package:bedrive/drive/actions/toggle_entries_offlined_tile.dart';
import 'package:bedrive/drive/actions/toggle_entries_starred_title.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';

import '../../models/file_entry.dart';
import '../layout/entry_view/file_thumbnail.dart';

Future<dynamic> showEntryActionsBottomSheet(
  BuildContext context,
  List<FileEntry> entries,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext _) => EntryActionsBottomSheet(entries),
  );
}

class EntryActionsBottomSheet extends StatelessWidget {
  final List<FileEntry> entries;

  const EntryActionsBottomSheet(this.entries, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: _Header(entries),
        ),
        PreviewEntryTile(entries),
        ShareEntryTile(entries),
        ShareableLinkTile(entries),
        ToggleEntriesStarredTile(entries),
        MoveCopyTile(entries),
        CopyToOwnDriveTile(entries),
        RenameEntryTile(entries),
        ToggledEntriesOfflinedTile(entries),
        DownloadEntriesTile(entries),
        RemoveSharedEntriesTile(entries),
        RestoreEntriesTile(entries),
        DeleteEntriesTitle(entries),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.entries);

  final List<FileEntry> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.length == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FileThumbnail(entries[0], size: FileThumbnailSize.small),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              entries[0].name,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: StyledText(
          ':count Items',
          replacements: {'count': entries.length.toString()},
          singleLine: true,
        ),
      );
    }
  }
}
