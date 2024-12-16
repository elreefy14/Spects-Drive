import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

import '../http/api_client.dart';
import '../i18n/get_device_locale.dart';
import 'models/bootstrap_data.dart';

part '../.generated/bootstrap/bootstrap_data_provider.g.dart';

class LocalConfig {
  final String appName;
  final String version;
  final String backendUrl;

  LocalConfig(PackageInfo packageInfo, YamlMap appConfig)
      : appName = packageInfo.appName,
        version = packageInfo.version,
        backendUrl = appConfig['backend_url'];
}

@Riverpod(keepAlive: true)
Future<BootstrapData> bootstrapData(BootstrapDataRef ref) async {
  final apiClient = ref.watch(apiClientProvider).requireValue;
  try {
    final jsonResponse = await apiClient.get(
      'remote-config/mobile',
      queryParams: {'activeLocale': getDeviceLocale()},
      options: ApiClientOptions(cacheResponse: true),
    );
    return BootstrapData.fromJson(jsonResponse);
  } catch (e) {
    final data = json.decode(await rootBundle
        .loadString('assets/config/fallback_bootstrap_data.json'));
    return BootstrapData.fromFallbackData(themes: data['themes']);
  }
}
