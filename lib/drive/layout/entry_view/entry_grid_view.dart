import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/layout/entry_view/drive_item_tap_handlers.dart';
import 'package:bedrive/drive/layout/entry_view/drive_item_trailing_action.dart';
import 'package:bedrive/drive/layout/entry_view/file_thumbnail.dart';
import 'package:bedrive/drive/offline/offlined_entries_controller.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntryGridView extends StatelessWidget {
  final List<FileEntry> entries;

  const EntryGridView({
    required this.entries,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int axisCount = switch (MediaQuery.of(context).size.width) {
      > 1000 => 4,
      > 600 => 3,
      _ => 2,
    };

    return SliverPadding(
      padding: const EdgeInsets.all(14),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: axisCount,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, index) => _GridItem(entries[index]),
          childCount: entries.length,
        ),
      ),
    );
  }
}

class _GridItem extends ConsumerWidget with DriveItemTapHandlers {
  final FileEntry fileEntry;

  const _GridItem(this.fileEntry);

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

    return InkResponse(
      containedInkWell: true,
      highlightShape: BoxShape.rectangle,
      onLongPress: () => isDisabled ? null : onLongPress(ref, fileEntry),
      onTap: () => isDisabled ? null : onTap(ref, fileEntry),
      child: Opacity(
        opacity: isDisabled ? 0.4 : 1,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected && !isDisabled
                    ? context.colorScheme.primary.withOpacity(0.1)
                    : context.colorScheme.background,
                borderRadius: BorderRadius.circular(
                  context.appTheme.panelRadius,
                ),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: FileThumbnail(
                      fileEntry,
                      size: FileThumbnailSize.unbound,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(context.appTheme.panelRadius),
                        topRight: Radius.circular(context.appTheme.panelRadius),
                      ),
                    ),
                  ),
                  _GridItemFooter(fileEntry)
                ],
              ),
            ),
            Align(
              alignment: const Alignment(-0.92, -0.92),
              child: _GridItemFloatingInfo(fileEntry),
            )
          ],
        ),
      ),
    );
  }
}

class _GridItemFooter extends StatelessWidget {
  final FileEntry fileEntry;

  const _GridItemFooter(this.fileEntry);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        height: 48,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                fileEntry.name,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DriveItemTrailingAction(fileEntry)
          ],
        ),
      ),
    );
  }
}

class _GridItemFloatingInfo extends ConsumerWidget {
  final FileEntry fileEntry;

  const _GridItemFloatingInfo(this.fileEntry);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShared = fileEntry.users.length > 1;
    bool isOfflined = ref.watch(
      offlinedEntriesControllerProvider.select(
        (s) => s.requireValue.contains(fileEntry.id),
      ),
    );
    double spacerWidth = 2;
    final children = <Widget>[];

    children.add(SizedBox(width: spacerWidth));
    if (isShared) {
      children.add(
        const Icon(Icons.people_alt, size: 13, color: Colors.white),
      );
    }
    if (fileEntry.isStarred) {
      children.add(SizedBox(width: spacerWidth));
      children.add(const Icon(Icons.star_sharp, size: 13, color: Colors.white));
    }
    if (isOfflined) {
      children.add(SizedBox(width: spacerWidth));
      children
          .add(const Icon(Icons.offline_pin, size: 12, color: Colors.white));
    }
    children.add(SizedBox(width: spacerWidth));

    if (children.length == 2) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(0, 0, 0, 0.35),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
