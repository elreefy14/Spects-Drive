import 'dart:async';

import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/ui/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../http/api_client_exception.dart';
import '../i18n/styled_text.dart';
import '../router_provider.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppThemeData get appTheme => Theme.of(this).extension<AppThemeData>()!;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showErrorSnackBar(
    String? text,
  ) {
    if (!mounted) return null;
    return ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      backgroundColor: colorScheme.error,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(Icons.error_outlined, color: colorScheme.onError),
          const SizedBox(width: 8),
          Flexible(
            fit: FlexFit.loose,
            child: StyledText(text ?? genericErrorMessage),
          ),
        ],
      ),
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showTextSnackBar(
      String text,
      {Map<String, dynamic>? replacements}) {
    if (!mounted) return null;
    return ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: StyledText(text, replacements: replacements),
    ));
  }

  Future<bool?> showAlertDialog({
    String? title,
    required String body,
    String? actionLabel,
    String? cancelLabel,
    bool isDanger = false,
  }) async {
    if (!mounted) return false;
    return showDialog<bool>(
      context: this,
      barrierDismissible: cancelLabel != null,
      builder: (BuildContext context) {
        final actions = <Widget>[];

        if (cancelLabel != null) {
          actions.add(TextButton(
            onPressed: () {
              context.pop(false);
            },
            child: StyledText(cancelLabel),
          ));
        }

        actions.add(
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor:
                  isDanger == true ? colorScheme.error : colorScheme.primary,
            ),
            child: StyledText(actionLabel ?? 'Continue'),
            onPressed: () {
              context.pop(true);
            },
          ),
        );

        return AlertDialog(
          title: title != null
              ? StyledText(
                  title,
                  color: isDanger ? context.colorScheme.error : null,
                )
              : null,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                StyledText(body, singleLine: false),
              ],
            ),
          ),
          actions: actions,
        );
      },
    );
  }
}

extension GoRouterLocation on GoRouter {
  RouteMatchList get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList;
  }
}

extension CacheForExtension on AutoDisposeRef<Object?> {
  void cacheResults() {
    final link = keepAlive();
    Timer? timer;

    onDispose(() {
      timer?.cancel();
    });

    onCancel(() {
      timer = Timer(const Duration(seconds: 30), () {
        link.close();
      });
    });

    onResume(() {
      timer?.cancel();
    });
  }
}

extension RouteIdentifier on WidgetRef {
  bool activeRouteIs(AppRoute route) {
    final router = read(goRouterProvider);
    return router.location.fullPath == route.path;
  }

  goToDestinationPickerScreen({
    required String destinationId,
    required List<FileEntry> targetEntries,
    required bool showMoveAction,
  }) {
    read(goRouterProvider).pushNamed(
      AppRoute.destinationPicker.name,
      pathParameters: {'folderId': destinationId},
      extra: {
        'targetEntries': targetEntries,
        'showMoveAction': showMoveAction,
      },
    );
  }
}
