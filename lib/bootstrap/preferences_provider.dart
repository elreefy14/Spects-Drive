import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part '../.generated/bootstrap/preferences_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferencesRepository> preferences(PreferencesRef ref) async {
  return SharedPreferencesRepository(await SharedPreferences.getInstance());
}

class SharedPreferencesRepository {
  final SharedPreferences _preferences;

  SharedPreferencesRepository(this._preferences);

  String? get(String key) {
    return _preferences.getString(key);
  }

  Future<bool> set(String key, String value) {
    return _preferences.setString(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
