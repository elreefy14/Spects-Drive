import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AppConfig {
  late final YamlMap _config;

  AppConfig._();

  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= AppConfig._();

  Future<YamlMap> init() async {
    _config = loadYaml(await rootBundle.loadString('app_config.yaml'));
    return _config;
  }

  YamlMap get() {
    return _config;
  }
}
