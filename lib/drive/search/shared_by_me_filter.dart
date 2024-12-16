import 'package:bedrive/drive/search/search_filter_button.dart';
import 'package:bedrive/drive/search/search_filters_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedByMeFilter extends ConsumerWidget {
  const SharedByMeFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchFiltersProvider);
    final filters = ref.read(searchFiltersProvider.notifier);

    return SearchFilterButton(
      isActive: state.sharedByMe != null && state.sharedByMe!,
      onPressed: () {
        filters.setSharedByMe(state.sharedByMe == null ? true : null);
      },
      label: const StyledText('Shared by me'),
    );
  }
}
