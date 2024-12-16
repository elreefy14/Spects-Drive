import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../i18n/styled_text.dart';

part '../.generated/ui/global_loading_indicator_provider.g.dart';

class GlobalLoadingIndicatorOptions {
  final bool dismissible;
  final Function? onDismiss;
  final String? text;

  const GlobalLoadingIndicatorOptions({
    this.dismissible = false,
    this.onDismiss,
    this.text,
  });
}

class GlobalLoadingIndicatorState {
  bool isVisible = false;
  GlobalLoadingIndicatorOptions? options;

  GlobalLoadingIndicatorState(this.isVisible, [this.options]);
}

@Riverpod(keepAlive: true)
class GlobalLoadingIndicator extends _$GlobalLoadingIndicator {
  void show({bool dismissible = false, Function? onDismiss, String? text}) {
    state = GlobalLoadingIndicatorState(
      true,
      GlobalLoadingIndicatorOptions(
        dismissible: dismissible,
        onDismiss: onDismiss,
        text: text,
      ),
    );
  }

  void hide() {
    state = GlobalLoadingIndicatorState(false);
  }

  @override
  GlobalLoadingIndicatorState build() {
    return GlobalLoadingIndicatorState(false);
  }
}

class GlobalLoadingIndicatorDialog extends ConsumerWidget {
  const GlobalLoadingIndicatorDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(globalLoadingIndicatorProvider);
    return PopScope(
      onPopInvoked: (popped) {
        if (state.options?.onDismiss != null && popped) {
          state.options!.onDismiss!();
        }
      },
      canPop: state.options != null && state.options!.dismissible,
      child: Center(
        child: Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.90,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: 20),
                  StyledText(
                    state.options?.text ?? 'Please wait...',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// handle showing and hiding global loading indicator
mixin GlobalLoadingIndicatorHandler {
  handleGlobalLoadingIndicator(WidgetRef ref) {
    ref.listen(
      globalLoadingIndicatorProvider,
      (prev, next) {
        if ((prev == null || !prev.isVisible) && next.isVisible) {
          showDialog(
            context: ref.context,
            builder: (context) => const GlobalLoadingIndicatorDialog(),
          ).then(
            (_) => {
              // if loader is dismissible, and is closed via barrier
              // tap or back button, mark it as hidden in state as well
              ref.read(globalLoadingIndicatorProvider.notifier).hide(),
            },
          );
        } else if (prev != null && prev.isVisible && !next.isVisible) {
          GoRouter.of(ref.context).pop();
        }
      },
    );
  }
}
