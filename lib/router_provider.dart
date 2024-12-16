import 'package:bedrive/auth/screens/forgot_passowrd_screen.dart';
import 'package:bedrive/bootstrap/bootstrap_data_provider.dart';
import 'package:bedrive/drive/destination_picker/destination_picker_screen.dart';
import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/folders/folder_screen.dart';
import 'package:bedrive/drive/layout/drive_drawer/settings_screen/settings_screen.dart';
import 'package:bedrive/drive/offline/offlined_entries_screen.dart';
import 'package:bedrive/drive/preview/preview_screen.dart';
import 'package:bedrive/drive/recent_screen.dart';
import 'package:bedrive/drive/search/search_screen.dart';
import 'package:bedrive/drive/sharing/shareable_link_screen/shareable_link_screen.dart';
import 'package:bedrive/drive/trash/trash_screen.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'auth/auth_state_provider.dart';
import 'auth/screens/login_screen.dart';
import 'auth/screens/register_screen.dart';
import 'auth/screens/verify_email_screen.dart';
import 'drive/home_screen.dart';
import 'drive/sharing/share_entry_screen/share_entry_screen.dart';
import 'drive/sharing/shared_with_me_screen.dart';
import 'drive/transfers/ui/transfers_screen.dart';
import 'models/file_entry.dart';
import 'providers/transfer_queue_provider.dart';

part '.generated/router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

enum AppRoute {
  home('/'),
  folder('/folder/:folderId'),
  recent('/recent'),
  sharedWithMe('/shared'),
  trash('/trash'),
  search('/search'),
  transfers('/transfers'),
  offline('/offline'),
  shareEntry('/share-entry'),
  shareableLink('/shareable-link'),
  preview('/preview/:entryId'),
  destinationPicker('/destination-picker/:folderId'),
  settings('/settings'),
  login('/login'),
  register('/register'),
  forgotPassword('/forgot-password'),
  confirmEmail('/confirm-email');

  final String path;

  const AppRoute(this.path);
}

enum AuthState {
  loggedIn,
  loggedOut,
  emailNotVerified,
}

AuthState getAuthState(GoRouterRef ref) {
  final value = ref.read(authStateProvider).valueOrNull;
  if (value == null) {
    return AuthState.loggedOut;
  } else if (value.emailVerifiedAt == null) {
    return AuthState.emailNotVerified;
  }

  return AuthState.loggedIn;
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authState = ValueNotifier<AuthState>(getAuthState(ref));

  ref.onDispose(authState.dispose);

  ref.listen(authStateProvider, (_, state) {
    authState.value = getAuthState(ref);
  });

  final router = GoRouter(
    observers: [SentryNavigatorObserver()],
    refreshListenable: authState,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      final path = state.uri.path;
      final settings = ref.read(bootstrapDataProvider).requireValue.settings;

      if (authState.value == AuthState.emailNotVerified) {
        // only allow email confirmation screen, if email is not confirmed
        if (settings.requireEmailConfirmation) {
          return '/confirm-email';
        } else {
          return null;
        }
      }

      // logged in
      if (authState.value == AuthState.loggedIn) {
        // if trying to access other auth routes, redirect to home
        if (path.startsWith('/login') ||
            path.startsWith('/register') ||
            path.startsWith('/forgot-password') ||
            path.startsWith('/confirm-email')) {
          return '/';
        } else {
          return null;
        }
      }

      // not logged in
      if (authState.value == AuthState.loggedOut) {
        // only allow accessing auth routes while not logged in
        if (!path.startsWith('/register') &&
            !path.startsWith('/forgot-password')) {
          return '/login';
        } else {
          return null;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        pageBuilder: (context, state) => NoTransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.register.path,
        name: AppRoute.register.name,
        pageBuilder: (context, state) => NoTransitionPage(
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.forgotPassword.path,
        name: AppRoute.forgotPassword.name,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.confirmEmail.path,
        name: AppRoute.confirmEmail.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: VerifyEmailScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.settings.path,
        name: AppRoute.settings.name,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoute.transfers.path,
        name: AppRoute.transfers.name,
        builder: (context, state) => const TransfersScreen(),
        onExit: (context) {
          ref.read(transferQueueProvider.notifier).clearAllCompleted();
          return true;
        },
      ),
      GoRoute(
        path: AppRoute.shareEntry.path,
        name: AppRoute.shareEntry.name,
        builder: (context, state) => ShareEntryScreen(state.extra as FileEntry),
      ),
      GoRoute(
        path: AppRoute.shareableLink.path,
        name: AppRoute.shareableLink.name,
        builder: (context, state) =>
            ShareableLinkScreen(state.extra as FileEntry),
      ),
      GoRoute(
        path: AppRoute.folder.path,
        name: AppRoute.folder.name,
        builder: (context, state) => FolderScreen(
          state.pathParameters['folderId']!,
          state.extra as FileEntry?,
        ),
      ),
      GoRoute(
        path: AppRoute.destinationPicker.path,
        name: AppRoute.destinationPicker.name,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return DestinationPickerScreen(
            destinationId: state.pathParameters['folderId'] as String,
            targetEntries: data['targetEntries'] as List<FileEntry>,
            showMoveAction: data['showMoveAction'] as bool,
          );
        },
      ),
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.recent.path,
        name: AppRoute.recent.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: RecentScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.sharedWithMe.path,
        name: AppRoute.sharedWithMe.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SharedWithMeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.trash.path,
        name: AppRoute.trash.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TrashScreen(),
        ),
      ),
      GoRoute(
        path: AppRoute.preview.path,
        name: AppRoute.preview.name,
        builder: (context, state) => PreviewScreen(
          fileEntry: state.extra as FileEntry?,
          entryId: int.parse(state.pathParameters['entryId']!),
        ),
      ),
      GoRoute(
        path: AppRoute.offline.path,
        name: AppRoute.offline.name,
        builder: (context, state) => const OfflinedEntriesScreen(),
      ),
      GoRoute(
        path: AppRoute.search.path,
        name: AppRoute.search.name,
        builder: (context, state) => SearchScreen(
          folder: state.extra as FileEntry?,
        ),
      ),
    ],
  );

  router.routerDelegate.addListener(() {
    final isDestinationPicker =
        router.location.fullPath == AppRoute.destinationPicker.path;
    final folderIdInPath = router.location.pathParameters['folderId'];
    final folderId = folderIdInPath == null || folderIdInPath == '0'
        ? null
        : int.parse(folderIdInPath);
    ref.read(driveStateProvider.notifier).syncStateWithRouter(
          driveMode: isDestinationPicker
              ? DriveMode.destinationPicker
              : DriveMode.drive,
          activeFolderId: folderId,
        );
  });

  return router;
}
