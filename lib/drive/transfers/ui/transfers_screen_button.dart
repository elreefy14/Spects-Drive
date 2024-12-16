import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/transfer_queue_provider.dart';
import '../../../router_provider.dart';

class TransfersScreenButton extends ConsumerWidget {
  const TransfersScreenButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferCount =
        ref.watch(transferQueueProvider.select((v) => switch (v) {
              AsyncData(:final value) => value.length,
              _ => 0,
            }));

    final button = IconButton(
      icon: const Icon(Icons.multiple_stop_outlined),
      onPressed: () {
        context.pushNamed(AppRoute.transfers.name);
      },
    );

    if (transferCount == 0) {
      return button;
    }

    return Badge.count(
      offset: const Offset(-2, 0),
      count: transferCount,
      child: button,
    );
  }
}
