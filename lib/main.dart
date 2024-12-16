import 'package:bedrive/bootstrap/app_config.dart';
import 'package:bedrive/bootstrap/app_startup_provider.dart';
import 'package:bedrive/ui/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'i18n/localization_provider.dart';
import 'router_provider.dart';

class MyObserver extends ProviderObserver {
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    // debugPrintStack(
    //   stackTrace: stackTrace,
    //   label: 'Provider $provider threw $error',
    // );
  }
}

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final appConfig = await AppConfig.instance.init();

  if (appConfig['sentry_dsn'] != null) {
    await SentryFlutter.init(
      (options) {
        options.dsn = appConfig['sentry_dsn'];
      },
      appRunner: () => initApp(),
    );
  } else {
    initApp();
  }
}

initApp() async {
  final container = ProviderContainer(observers: [MyObserver()]);
  await container.read(appStartupProvider.future);
  FlutterNativeSplash.remove();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final (:light, :dark, :selectedTheme) =
        ref.watch(appThemeProvider).requireValue;
    final localizer = ref.watch(localizationProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: dark,
      themeMode: selectedTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: localizer.supportedLocales(),
      routerConfig: goRouter,
    );
  }
}
