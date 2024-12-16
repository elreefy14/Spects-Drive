import 'package:bedrive/drive/layout/drive_toolbar/drive_screen_sort_provider.dart';
import 'package:bedrive/drive/layout/entry_view/entry_grid_view.dart';
import 'package:bedrive/drive/layout/entry_view/file_list_view.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../i18n/styled_text.dart';
import '../../models/paginated_file_entries.dart';
import '../drive_state_provider.dart';
import '../illustrated_message.dart';
import 'drive_toolbar/drive_toolbar_sliver.dart';

class DriveScreenContent extends HookConsumerWidget {
  final String uniqueId;
  final SortDescriptor? sortDescriptor;
  final Widget emptyStateWidget;
  final VoidCallback onLoadNextPage;
  final RefreshCallback onRefresh;
  final AsyncValue<PaginatedFileEntries> entries;
  final bool hideToolbar;

  const DriveScreenContent({
    required this.uniqueId,
    required this.emptyStateWidget,
    required this.onLoadNextPage,
    required this.onRefresh,
    required this.entries,
    this.sortDescriptor,
    this.hideToolbar = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(
      driveStateProvider.select((s) => s.activeViewMode),
    );
    final controller = useScrollController();

    // load next page when user scrolls to the bottom
    void onScroll() {
      final maxScroll = controller.position.maxScrollExtent;
      final currentScroll = controller.position.pixels;
      if (maxScroll - currentScroll <= 200.0) {
        onLoadNextPage();
      }
    }

    // hook up scroll listener
    useEffect(() {
      controller.addListener(onScroll);
      return () => controller.removeListener(onScroll);
    }, [controller]);

    Widget contentSliver;
    Widget footerSliver = const SliverToBoxAdapter(child: SizedBox.shrink());

    switch (entries) {
      // data already loaded at least once, but might be empty or loading more
      case AsyncValue(valueOrNull: var pagination) when pagination != null:
        if (pagination.total == 0) {
          contentSliver = StateMessageSliver(child: emptyStateWidget);
        } else {
          contentSliver = viewMode == DriveViewMode.list
              ? EntryListView(entries: pagination.data)
              : EntryGridView(entries: pagination.data);
        }

        // check for "isLoading" first, so spinner is shown when retry button is clicked, even if error exists
        if (entries.isLoading) {
          footerSliver = const LoadingMoreSliver();
        } else if (entries.hasError) {
          footerSliver = LoadingMoreErrorSliver(
            onRetry: () => onLoadNextPage(),
            error: entries.error,
          );
        }
      case AsyncError(:final error, :final isLoading) when isLoading == false:
        contentSliver = ErrorStateMessage(
          message:
              error is ApiClientException ? error.message : genericErrorMessage,
          onTryAgain: () => onRefresh(),
        );
      default:
        contentSliver =
            const StateMessageSliver(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller,
        slivers: <Widget>[
          if (!hideToolbar)
            DriveToolbarSliver(
              uniqueScreenId: uniqueId,
              sortDescriptor: sortDescriptor,
            ),
          contentSliver,
          footerSliver,
        ],
      ),
    );
  }
}

// full size error message, shown if first page can't be loaded
class ErrorStateMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTryAgain;

  const ErrorStateMessage({
    required this.message,
    required this.onTryAgain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StateMessageSliver(
      child: IllustratedMessage(
        title: 'Something went wrong',
        message: message,
        assetPath: 'assets/icons/bug-fixing.svg',
        onTryAgain: onTryAgain,
      ),
    );
  }
}

// error message shown at the bottom of the list, when loading more fails
class LoadingMoreErrorSliver extends StatelessWidget {
  final VoidCallback onRetry;
  final Object? error;

  const LoadingMoreErrorSliver({
    required this.onRetry,
    this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final error = this.error;
    return SliverToBoxAdapter(
      child: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: context.textTheme.displaySmall!.color,
        ),
        icon: const Icon(Icons.refresh),
        onPressed: onRetry,
        label: StyledText(
          error is ApiClientException
              ? error.message
              : 'Could not load files. Tap to retry.',
        ),
      ),
    );
  }
}

// loading spinner shown at the bottom of the list, when loading more files
class LoadingMoreSliver extends StatelessWidget {
  const LoadingMoreSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

// wrapper for other status message slivers
class StateMessageSliver extends StatelessWidget {
  final Widget child;

  const StateMessageSliver({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(24),
      sliver: SliverFillRemaining(
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
