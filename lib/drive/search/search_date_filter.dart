import 'package:bedrive/drive/search/clear_search_filter_tile.dart';
import 'package:bedrive/drive/search/search_filter_button.dart';
import 'package:bedrive/drive/search/search_filters_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchDateFilter extends ConsumerWidget {
  const SearchDateFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchFiltersProvider);

    return SearchFilterButton(
      isActive: state.date != null,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const DateFilterBottomSheet(),
        );
      },
      label: state.date == null
          ? const StyledText('Modified')
          : StyledText(state.date!['label']!),
    );
  }
}

class DateFilterBottomSheet extends ConsumerWidget {
  const DateFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(searchFiltersProvider.notifier);
    final hasDate = ref.watch(searchFiltersProvider).date != null;
    return ListView(
      shrinkWrap: true,
      children: [
        ClearSearchFilterTile(
          label: 'Select date',
          filterIsActive: hasDate,
          onClear: () => filters.setDate(null),
        ),
        ...DatePreset.values.map(
          (preset) => ListTile(
            title: Text(preset.label),
            onTap: () {
              filters.setDate(preset.buildDateRange());
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}

enum DatePreset {
  today('Today'),
  last7Days('Last 7 days'),
  last30Days('Last 30 days'),
  thisYear('This year'),
  lastYear('Last year');

  final String label;

  const DatePreset(this.label);

  Map<String, String> buildDateRange() {
    return switch (this) {
      DatePreset.today => {
          'label': label,
          'start': DateTime.now().toIso8601String(),
          'end': DateTime.now().toIso8601String(),
        },
      DatePreset.last7Days => {
          'label': label,
          'start': DateTime.now()
              .subtract(const Duration(days: 7))
              .toIso8601String(),
          'end': DateTime.now().toIso8601String(),
        },
      DatePreset.last30Days => {
          'label': label,
          'start': DateTime.now()
              .subtract(const Duration(days: 30))
              .toIso8601String(),
          'end': DateTime.now().toIso8601String(),
        },
      DatePreset.thisYear => {
          'label': label,
          'start': DateTime(DateTime.now().year, 1, 1).toIso8601String(),
          'end': DateTime.now().toIso8601String(),
        },
      DatePreset.lastYear => {
          'label': label,
          'start': DateTime(DateTime.now().year - 1, 1, 1).toIso8601String(),
          'end': DateTime(DateTime.now().year - 1, 12, 31).toIso8601String(),
        }
    };
  }
}
