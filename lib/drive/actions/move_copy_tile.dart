import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MoveCopyTile extends ConsumerWidget with MoveCopyAction {
  final List<FileEntry> entries;

  const MoveCopyTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (shouldHide(ref, entries)) {
      return const SizedBox.shrink();
    }
    return ListTile(
      leading: const Icon(Icons.drive_file_move_outlined),
      title: const StyledText('Move / copy'),
      onTap: () {
        context.pop();
        performAction(ref, entries);
      },
    );
  }
}

mixin MoveCopyAction {
  bool shouldHide(WidgetRef ref, List<FileEntry> entries) {
    if (ref.activeRouteIs(AppRoute.trash) ||
        ref.activeRouteIs(AppRoute.sharedWithMe) ||
        !entries.every((e) => e.permissions.update)) {
      return true;
    }
    return false;
  }

  void performAction(WidgetRef ref, List<FileEntry> entries) {
    ref.goToDestinationPickerScreen(
      destinationId: '0',
      targetEntries: entries,
      showMoveAction: true,
    );
  }
}
