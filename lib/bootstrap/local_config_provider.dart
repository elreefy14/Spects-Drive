import 'package:bedrive/bootstrap/app_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part '../.generated/bootstrap/local_config_provider.g.dart';

class LocalConfig {
  final String appName;
  final String version;
  final String backendUrl;

  LocalConfig(
    PackageInfo packageInfo,
    YamlMap appConfig,
  )   : appName = packageInfo.appName,
        version = packageInfo.version,
        backendUrl = appConfig['backend_url'];
}

@Riverpod(keepAlive: true)
Future<LocalConfig> localConfig(LocalConfigRef ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  YamlMap appConfig = AppConfig.instance.get();
  return LocalConfig(packageInfo, appConfig);
}
