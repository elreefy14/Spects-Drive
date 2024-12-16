import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/drive/layout/drive_toolbar/sort_popup_menu_button.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DriveToolbarSliver extends StatelessWidget {
  final String uniqueScreenId;
  final SortDescriptor? sortDescriptor;

  const DriveToolbarSliver({
    required this.uniqueScreenId,
    this.sortDescriptor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.colorScheme.background,
      foregroundColor: context.colorScheme.onBackground,
      automaticallyImplyLeading: false,
      title: SortPopupMenuButton(
        uniqueId: uniqueScreenId,
        forcedDescriptor: sortDescriptor,
      ),
      //leadingWidth: 344,
      centerTitle: false,
      titleSpacing: 10,
      floating: true,
      snap: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: Theme.of(context).dividerColor,
          height: 1,
        ),
      ),
      actions: const <Widget>[
        _ToggleViewModeButton(),
      ],
    );
  }
}

class _ToggleViewModeButton extends ConsumerWidget {
  const _ToggleViewModeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(
      driveStateProvider.select((s) => s.activeViewMode),
    );
    final icon = currentMode == DriveViewMode.grid
        ? Icons.view_agenda_outlined
        : Icons.grid_view_outlined;
    final tooltip =
        currentMode == DriveViewMode.grid ? 'View as list' : 'View as grid';
    return IconButton(
        icon: Icon(icon),
        tooltip: tooltip,
        onPressed: () {
          final nextMode = currentMode == DriveViewMode.grid
              ? DriveViewMode.list
              : DriveViewMode.grid;
          ref.read(driveStateProvider.notifier).setViewMode(nextMode);
        });
  }
}
