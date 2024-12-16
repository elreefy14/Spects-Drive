import 'package:bedrive/auth/auth_state_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../http/api_client_exception.dart';
import '../../i18n/styled_text.dart';

enum SocialLoginProvider {
  google,
  apple,
}

extension SocialLoginButton on SocialLoginProvider {
  Color get backgroundColor {
    switch (this) {
      case SocialLoginProvider.google:
        return Colors.white;
      case SocialLoginProvider.apple:
        return Colors.black;
    }
  }

  Color get foregroundColor {
    switch (this) {
      case SocialLoginProvider.google:
        return Colors.black87;
      case SocialLoginProvider.apple:
        return Colors.white70;
    }
  }
}

class LoginWithGoogleButton extends HookConsumerWidget {
  final SocialLoginProvider provider;

  const LoginWithGoogleButton(
    this.provider, {
    super.key,
  });

  Future<void> _loginWithGoogle(WidgetRef ref) async {
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    String? errorMessage;

    try {
      final account = await googleSignIn.signIn();
      final token =
          account != null ? (await account.authentication).accessToken : null;
      if (token != null) {
        await ref
            .read(authStateProvider.notifier)
            .loginWithSocials(SocialLoginProvider.google, token);
        return;
      }
    } catch (e) {
      errorMessage = switch (e) {
        PlatformException _ => e.message,
        ApiClientException _ => e.message,
        _ => null,
      };
    }

    if (ref.context.mounted) {
      ref.context.showAlertDialog(
        title: 'There was an issue logging in',
        body: errorMessage ?? genericErrorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: provider.backgroundColor,
          foregroundColor: provider.foregroundColor,
        ),
        icon: _Icon(provider),
        label: StyledText('Sign in with ${provider.name}'),
        onPressed: isLoading.value
            ? null
            : () async {
                isLoading.value = true;
                await _loginWithGoogle(ref);
                isLoading.value = false;
              },
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final SocialLoginProvider provider;

  const _Icon(this.provider);

  @override
  Widget build(BuildContext context) {
    String logo =
        provider == SocialLoginProvider.apple ? 'apple-white' : provider.name;
    return SvgPicture.asset(
      'assets/social-logos/$logo-logo.svg',
      height: 26,
      width: 26,
    );
  }
}
