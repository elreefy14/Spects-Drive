import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/layout/app_bar/selection_mode_app_bar.dart';
import 'package:bedrive/models/paginated_file_entries.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/ui/global_loading_indicator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_bar/default_drive_app_bar.dart';
import 'drive_drawer/drive_drawer.dart';

class DriveScaffold extends ConsumerWidget with GlobalLoadingIndicatorHandler {
  final Widget child;
  final PreferredSizeWidget appBar;

  const DriveScaffold({
    required this.child,
    required this.appBar,
    super.key,
  });

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    return switch (location) {
      '/' => 0,
      '/recent' => 1,
      '/shared' => 2,
      '/trash' => 3,
      _ => 0,
    };
  }

  void _onItemTapped(int index, BuildContext context) {
    return switch (index) {
      1 => context.goNamed(AppRoute.recent.name),
      2 => context.goNamed(AppRoute.sharedWithMe.name),
      3 => context.goNamed(AppRoute.trash.name),
      _ => context.goNamed(AppRoute.home.name),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleGlobalLoadingIndicator(ref);

    return Scaffold(
      body: child,
      drawer: const DriveDrawer(),
      appBar: appBar,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open_rounded),
              label: 'Files',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: 'Recent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share_outlined),
              label: 'Shared',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete_outline_rounded),
              label: 'Trash',
            ),
          ],
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
        ),
      ),
    );
  }
}

class DriveAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  final String title;
  final AsyncValue<PaginatedFileEntries> entries;

  const DriveAppBar({
    required this.title,
    required this.entries,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEntries = ref.watch(
      driveStateProvider.select((s) => s.selectedEntries),
    );
    return selectedEntries.isNotEmpty
        ? SelectionModeAppBar(entries)
        : DefaultDriveAppBar(title);
  }
}
