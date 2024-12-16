import 'package:bedrive/drive/layout/app_bar/new_entry_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewEntryButton extends ConsumerWidget {
  const NewEntryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.add_rounded),
      onPressed: () {
        showModalBottomSheet(
          shape: const Border(),
          context: context,
          builder: (_) => const NewEntryBottomSheet(),
        );
      },
    );
  }
}
