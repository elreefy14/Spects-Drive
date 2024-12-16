import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../i18n/styled_text.dart';
import '../../models/file_entry.dart';
import '../../router_provider.dart';

class PreviewEntryTile extends ConsumerWidget {
  final List<FileEntry> entries;

  const PreviewEntryTile(this.entries, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (entries.length != 1 ||
        ref.activeRouteIs(AppRoute.preview) ||
        entries[0].type == 'folder') {
      return const SizedBox.shrink();
    }
    return ListTile(
      leading: const Icon(Icons.remove_red_eye_outlined),
      title: const StyledText('Preview'),
      onTap: () {
        context.pop();
        context.pushNamed(
          AppRoute.preview.name,
          extra: entries[0],
          pathParameters: {
            'entryId': entries[0].id.toString(),
          },
        );
      },
    );
  }
}
