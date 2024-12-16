import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../bootstrap/bootstrap_data_provider.dart';
import '../http/api_client.dart';
import 'backend_locale.dart';
import 'get_device_locale.dart';

part '../.generated/i18n/localization_provider.g.dart';

// observer for getting notified when device language changes
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);

  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}

@Riverpod(keepAlive: true)
Localizer localization(LocalizationRef ref) {
  final api = ref.watch(apiClientProvider).requireValue;

  // reload localizer lines when device language changes. This will only happen
  // if user changes language via device settings, while app is open
  final observer = _LocaleObserver((locales) async {
    if (getDeviceLocale() != ref.state.activeLocale) {
      // clone localizer so any widgets and providers that depend on it are reloaded
      ref.state = await ref.state.cloneForLocale(getDeviceLocale());
    }
  });

  // bind and unbind locale observer when the provider is created and disposed
  WidgetsBinding.instance.addObserver(observer);
  ref.onDispose(() => WidgetsBinding.instance.removeObserver(observer));

  // create localizer instance with locales from bootstrap data.
  // "bootstrapDataProvider" will load all available locales from backend and
  // lines for locale returned by "getDeviceLocale()", so there's no
  // need to load them here and we can return localizer synchronously
  final locales = {
    for (var locale in ref.watch(bootstrapDataProvider).requireValue.locales)
      locale.language: locale
  };
  return Localizer(getDeviceLocale(), locales, api);
}

class Localizer {
  final Map<String, BackendLocale> locales;
  final ApiHttpClient apiClient;
  String activeLocale;

  Localizer(this.activeLocale, this.locales, this.apiClient);

  Future<Localizer> cloneForLocale(String langeCode) async {
    final localizer = Localizer(langeCode, locales, apiClient);
    await localizer.maybeLoadLines();
    return localizer;
  }

  List<Locale> supportedLocales() {
    return locales.keys.map((e) => Locale(e)).toList();
  }

  String translate(String message, [Map<String, dynamic>? replacements]) {
    message = locales[activeLocale]?.lines?[message] ?? message;

    if (replacements != null) {
      // find plural config e.g. [one 1 item|other :count items]
      final match = RegExp(r'\[(.*?)\]').firstMatch(message);
      final count = replacements['count'];

      if (match != null && count != null && (count as int) != 0) {
        final pluralConfig = match.group(1);
        final parts = pluralConfig!.split('|');
        final count = replacements['count'];
        String part = count == 1 ? parts[0] : parts[1];

        // get rid of plural prefix e.g. one 1 item => 1 item
        part = part.split(' ').sublist(1).join(' ');

        message = message.replaceAll(match.group(0)!, part);
      }

      for (var entry in replacements.entries) {
        message =
            message.replaceAll(RegExp(':${entry.key}'), entry.value.toString());
      }
    }

    return message;
  }

  Future<void> maybeLoadLines() async {
    final cacheFile = File(await _getCachedLocalePath());
    final cachedLocale = await _getCachedLocale(cacheFile);
    if (cachedLocale != null) {
      locales[activeLocale] = cachedLocale;
    } else {
      try {
        final response = await apiClient.get('localizations/$activeLocale');
        final locale = BackendLocale.fromJson(
          response['localization'],
        );
        cacheFile.writeAsString(locale.toRawJson());
        locales[activeLocale] = locale;
      } catch (e) {
        //
      }
    }
  }

  // if cached locale exists and is up to date, return it,
  // otherwise return null so it can be fetched from the backend
  Future<BackendLocale?> _getCachedLocale(File cachedLocaleFile) async {
    if (await cachedLocaleFile.exists()) {
      final cachedLocale =
          BackendLocale.fromRawJson(await cachedLocaleFile.readAsString());
      if (cachedLocale.lines != null) {
        final backendLocale = locales[activeLocale];
        if (backendLocale != null &&
            !cachedLocale.updatedAt.isBefore(backendLocale.updatedAt)) {
          return cachedLocale;
        }
      }
    }
    return null;
  }

  _getCachedLocalePath() async {
    final dir = await getApplicationSupportDirectory();
    return '${dir.path}/$activeLocale.json';
  }
}
