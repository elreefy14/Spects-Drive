import 'package:bedrive/bootstrap/preferences_provider.dart';

class AccessTokenStore {
  String? _accessToken;

  AccessTokenStore._();

  static AccessTokenStore? _instance;

  static AccessTokenStore get instance => _instance ??= AccessTokenStore._();

  late final SharedPreferencesRepository _preferences;

  init(SharedPreferencesRepository preferences) async {
    _accessToken = preferences.get('access_token');
    _preferences = preferences;
  }

  String? get() {
    return _accessToken;
  }

  Future<void> put(String? token) async {
    _accessToken = token;
    if (token != null) {
      await _preferences.set('access_token', token);
    } else {
      await _preferences.remove('access_token');
    }
  }
}
