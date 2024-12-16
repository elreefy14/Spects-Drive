import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SortPopupMenuButton extends HookConsumerWidget {
  final String uniqueId;
  final SortDescriptor? forcedDescriptor;

  const SortPopupMenuButton({
    required this.uniqueId,
    this.forcedDescriptor,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(driveScreenSortProvider(uniqueId).notifier);
    final descriptor =
        forcedDescriptor ?? ref.watch(driveScreenSortProvider(uniqueId))!;

    onSelected(dynamic value) {
      if (value is DriveSortColumn) {
        notifier.changeSort(uniqueId, descriptor.copyWith(column: value));
      } else if (value is DriveSortDirection) {
        notifier.changeSort(uniqueId, descriptor.copyWith(direction: value));
      }
    }

    return PopupMenuButton(
      enabled: forcedDescriptor == null,
      position: PopupMenuPosition.under,
      onSelected: forcedDescriptor == null ? onSelected : null,
      child: _Trigger(
        descriptor: descriptor,
        enabled: forcedDescriptor == null,
      ),
      itemBuilder: (BuildContext context) {
        final columns = DriveSortColumn.values.map((col) {
          return PopupMenuItem<DriveSortColumn>(
            value: col,
            child: StyledText(
              col.label,
              color:
                  descriptor.column == col ? context.colorScheme.primary : null,
            ),
          );
        });
        final directions = DriveSortDirection.values.map((dir) {
          return PopupMenuItem<DriveSortDirection>(
            value: dir,
            child: StyledText(
              dir.label,
              color: descriptor.direction == dir
                  ? context.colorScheme.primary
                  : null,
            ),
          );
        });
        return <PopupMenuEntry>[
          const _Header('DIRECTION'),
          ...directions,
          const PopupMenuDivider(),
          const _Header('SORT BY'),
          ...columns
        ];
      },
    );
  }
}

class _Trigger extends StatelessWidget {
  final SortDescriptor descriptor;
  final bool enabled;

  const _Trigger({
    required this.descriptor,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyledText(
              descriptor.column.label,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(width: 4),
            Icon(
              descriptor.direction == DriveSortDirection.desc
                  ? Icons.arrow_downward_outlined
                  : Icons.arrow_upward_outlined,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends PopupMenuEntry<Never> {
  final String label;

  const _Header(this.label);

  @override
  bool represents(void value) => false;

  @override
  State<_Header> createState() => _HeaderState();

  @override
  double get height => kMinInteractiveDimension;
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      enabled: false,
      child: StyledText(widget.label, style: context.textTheme.bodySmall),
    );
  }
}
