import 'dart:io';

import 'package:bedrive/auth/widgets/social_login_button.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../bootstrap/bootstrap_data_provider.dart';
import '../bootstrap/models/bootstrap_data.dart';
import '../http/api_client.dart';
import 'access_token_store.dart';
import 'user.dart';

part '../.generated/auth/auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  Future<void> logout() async {
    state = const AsyncData(null);
    AccessTokenStore.instance.put(null);
  }

  Future<void> login(Map<String, String> payload) async {
    payload['token_name'] = await deviceIdentifier();
    final response = await ref
        .watch(apiClientProvider)
        .requireValue
        .post('auth/login', payload);
    _setLoggedInUser(BootstrapData.fromJson(response).user);
  }

  Future<void> register(Map<String, String> payload) async {
    payload['token_name'] = await deviceIdentifier();
    final response = await ref
        .watch(apiClientProvider)
        .requireValue
        .post('auth/register', payload);
    _setLoggedInUser(BootstrapData.fromJson(response['bootstrapData']).user);
  }

  Future<void> resendVerificationEmail() async {
    await ref.watch(apiClientProvider).requireValue.post(
      'resend-email-verification',
      {'email': state.requireValue?.email},
    );
  }

  Future<void> validateEmailVerificationOtp(String code) async {
    await ref.watch(apiClientProvider).requireValue.post(
      'validate-email-verification-otp',
      {'code': code},
    );
    state = AsyncData(
      state.requireValue?.copyWith(emailVerifiedAt: DateTime.now()),
    );
  }

  Future<String?> sendResetPasswordLink(String email) async {
    final response = await ref.watch(apiClientProvider).requireValue.post(
      'auth/password/email',
      {'email': email},
    );
    return response['message'];
  }

  Future<void> loginWithSocials(
    SocialLoginProvider provider,
    String accessToken,
  ) async {
    final api = ref.watch(apiClientProvider).requireValue;
    final response = await api.get(
      'auth/social/${provider.name}/callback',
      queryParams: {
        'tokenForDevice': await deviceIdentifier(),
        'tokenFromApi': accessToken
      },
    );
    _setLoggedInUser(BootstrapData.fromJson(response).user);
  }

  _setLoggedInUser(User? user) {
    AccessTokenStore.instance.put(user?.accessToken);
    state = AsyncData(user);
  }

  @override
  Future<User?> build() async {
    final bootstrapData = await ref.watch(bootstrapDataProvider.future);
    final apiClient = ref.watch(apiClientProvider).requireValue;

    // logout if any backend API calls return 401 error
    final unsubscribe = apiClient.onError((e) {
      if (e.statusCode == 401) {
        ref.read(authStateProvider.notifier).logout();
      }
    });
    ref.onDispose(() => unsubscribe());

    return bootstrapData.user;
  }
}

Future<String> deviceIdentifier() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    return (await deviceInfo.iosInfo).name;
  } else {
    return (await deviceInfo.androidInfo).display;
  }
}
