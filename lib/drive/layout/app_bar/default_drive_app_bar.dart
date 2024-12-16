import 'package:bedrive/drive/layout/app_bar/new_entry_button.dart';
import 'package:bedrive/drive/layout/app_bar/search_button.dart';
import 'package:bedrive/drive/transfers/ui/transfers_screen_button.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultDriveAppBar extends ConsumerWidget {
  final String title;

  const DefaultDriveAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: const [
        TransfersScreenButton(),
        NewEntryButton(),
        SearchButton(),
      ],
      title: StyledText(title),
    );
  }
}
