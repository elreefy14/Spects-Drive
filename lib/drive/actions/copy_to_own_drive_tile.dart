import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CopyToOwnDriveTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const CopyToOwnDriveTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.activeRouteIs(AppRoute.sharedWithMe) ||
        !entries.every((e) => e.permissions.download)) {
      return const SizedBox.shrink();
    }
    return ListTile(
      leading: const Icon(Icons.file_copy_outlined),
      title: const StyledText('Make a copy'),
      onTap: () {
        context.pop();
        ref.goToDestinationPickerScreen(
          destinationId: '0',
          targetEntries: entries,
          showMoveAction: false,
        );
      },
    );
  }
}
