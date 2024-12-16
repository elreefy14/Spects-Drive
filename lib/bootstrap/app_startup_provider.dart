import 'package:background_fetch/background_fetch.dart';
import 'package:bedrive/auth/access_token_store.dart';
import 'package:bedrive/auth/auth_state_provider.dart';
import 'package:bedrive/bootstrap/preferences_provider.dart';
import 'package:bedrive/drive/database.dart';
import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/drive/notifications/firebase_messaging_provider.dart';
import 'package:bedrive/drive/notifications/local_notifications_provider.dart';
import 'package:bedrive/drive/offline/api_response_cache.dart';
import 'package:bedrive/drive/offline/offlined_entries_controller.dart';
import 'package:bedrive/ui/app_theme_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../http/api_client.dart';
import '../providers/transfer_queue_provider.dart';
import 'bootstrap_data_provider.dart';
import 'local_config_provider.dart';

part '../.generated/bootstrap/app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  // ensure dependent providers are disposed as well
  ref.onDispose(() {
    ref.invalidate(preferencesProvider);
    ref.invalidate(localConfigProvider);
    ref.invalidate(apiClientProvider);
    ref.invalidate(bootstrapDataProvider);
    ref.invalidate(appThemeProvider);
    ref.invalidate(driveApiProvider);
    ref.invalidate(authStateProvider);
    ref.invalidate(driveStateProvider);
    ref.invalidate(offlinedEntriesControllerProvider);
    ref.invalidate(localNotificationsProvider);
    ref.invalidate(firebaseMessagingProvider);
    ref.invalidate(transferQueueProvider);
  });

  final preferences = await ref.watch(preferencesProvider.future);
  await ref.watch(localConfigProvider.future);
  await AccessTokenStore.instance.init(preferences);
  await ref.watch(apiClientProvider.future);
  await ref.watch(bootstrapDataProvider.future);
  await ref.watch(appThemeProvider.future);

  // read it so that it's initialized, but don't reload the whole app on change
  await ref.read(driveApiProvider.future);
  await ref.read(authStateProvider.future);
  ref.read(driveStateProvider);
  ref.read(localNotificationsProvider);
  await ref.read(firebaseMessagingProvider.future);
  await ref.read(offlinedEntriesControllerProvider.future);
  await ref.read(transferQueueProvider.future);

  configureApiResponseCacheBackgroundCleanup(ref);
  configureOfflinedFilesBackgroundSync(ref);
}

configureApiResponseCacheBackgroundCleanup(AppStartupRef ref) {
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 1440,
      requiresDeviceIdle: false,
      requiredNetworkType: NetworkType.NONE,
    ),
    (String taskId) async {
      final db = ref.read(appDatabaseProvider);
      final apiCache = ApiResponseCacheDao(db);
      await apiCache.clean();
      BackgroundFetch.finish(taskId);
    },
    (String taskId) async {
      BackgroundFetch.finish(taskId);
    },
  );
}

configureOfflinedFilesBackgroundSync(AppStartupRef ref) {
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 1440,
      requiresDeviceIdle: true,
      requiredNetworkType: NetworkType.UNMETERED,
    ),
    (String taskId) async {
      final offlinedEntries = ref.read(
        offlinedEntriesControllerProvider.notifier,
      );
      offlinedEntries.syncWithBackend();
      BackgroundFetch.finish(taskId);
    },
    (String taskId) async {
      BackgroundFetch.finish(taskId);
    },
  );
}
