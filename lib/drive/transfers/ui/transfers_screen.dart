import 'package:bedrive/ui/global_loading_indicator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../bootstrap/local_config_provider.dart';
import '../../../i18n/styled_text.dart';
import '../../../providers/transfer_queue_provider.dart';
import '../../illustrated_message.dart';
import '../models/transfer_queue_item.dart';
import 'transfer_screen_list_item.dart';

class TransfersScreen extends ConsumerWidget
    with GlobalLoadingIndicatorHandler {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleGlobalLoadingIndicator(ref);
    return Scaffold(
      appBar: AppBar(title: const StyledText('Transfers'), centerTitle: false),
      body: const TransferList(),
    );
  }
}

class TransferList extends ConsumerWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transfers = ref.watch(transferQueueProvider);
    if (transfers case AsyncData(:final value)) {
      if (value.isEmpty) {
        return const NoTransfersMessage();
      }

      final downloads =
          value.values.where((e) => e.type == TransferType.download).toList();
      final uploads =
          value.values.where((e) => e.type == TransferType.upload).toList();
      final offline =
          value.values.where((e) => e.type == TransferType.offline).toList();

      List<Widget> children = [];

      if (downloads.isNotEmpty) {
        children.add(TransferSection('downloads', downloads));
      }
      if (uploads.isNotEmpty) {
        children.add(TransferSection('uploads', uploads));
      }
      if (offline.isNotEmpty) {
        children.add(TransferSection('offline', offline));
      }

      return CustomScrollView(
        slivers: children,
      );
    }

    return const Center(child: CircularProgressIndicator());
  }
}

class TransferSection extends StatelessWidget {
  const TransferSection(this.title, this.transfers, {super.key});

  final String title;
  final List<TransferQueueItem> transfers;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 14),
            child: StyledText(title,
                capitalize: true,
                size: 16,
                style: Theme.of(context).textTheme.titleMedium),
          );
        }
        index -= 1;
        return TransfersScreenListItem(transfers.elementAt(index));
      }, childCount: transfers.length + 1),
    );
  }
}

class NoTransfersMessage extends ConsumerWidget {
  const NoTransfersMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(localConfigProvider).requireValue.appName;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: IllustratedMessage(
          title: 'No active file transfers',
          message:
              'All active transfers between $appName and your device will appear here.',
          assetPath: 'assets/icons/transfer-files.svg',
        ),
      ),
    );
  }
}
