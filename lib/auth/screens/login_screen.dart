import 'dart:io';

import 'package:bedrive/forms/form_validators.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bootstrap/bootstrap_data_provider.dart';
import '../../http/api_client_exception.dart';
import '../../i18n/localization_provider.dart';
import '../../i18n/styled_text.dart';
import '../../router_provider.dart';
import '../auth_state_provider.dart';
import '../widgets/auth_screen_layout.dart';
import '../widgets/auth_screen_text_field.dart';
import '../widgets/social_login_button.dart';

class LoginScreen extends HookConsumerWidget {
  final _loginFormKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final isLoading = useState(false);
    final backendErrors = useState<Map<String, String>>({});
    final formPayload = useState<Map<String, String>>({});
    final bool showGoogleBtn = ref
        .watch(bootstrapDataProvider)
        .requireValue
        .settings
        .enableGoogleLogin;

    login() async {
      backendErrors.value.clear();
      if (_loginFormKey.currentState!.validate()) {
        _loginFormKey.currentState!.save();
        try {
          isLoading.value = true;
          await ref.read(authStateProvider.notifier).login(formPayload.value);
        } on ApiClientException catch (e) {
          if (e.validationErrors != null) {
            backendErrors.value.addAll(e.validationErrors!);
            _loginFormKey.currentState!.validate();
          } else {
            context.showErrorSnackBar(e.message);
          }
        } finally {
          isLoading.value = false;
        }
      }
    }

    return AuthScreenLayout(
      title: StyledText(
        'Sign in to your account',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      footer: const LoginScreenFooter(),
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthScreenTextField(
              label: localizer.translate('Email'),
              icon: const Icon(Icons.email_outlined),
              onSaved: (v) => formPayload.value['email'] = v!,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: FormValidators.compose(
                localizer,
                [
                  FormValidators.required(),
                  FormValidators.email(),
                  FormValidators.backendError(backendErrors.value, 'email')
                ],
              ),
            ),
            const SizedBox(height: 14),
            AuthScreenTextField(
              onSaved: (v) => formPayload.value['password'] = v!,
              obscureText: true,
              icon: const Icon(Icons.lock_outlined),
              label: localizer.translate('Password'),
              textInputAction: TextInputAction.done,
              onFieldSubmitted: isLoading.value ? null : (_) => login(),
              validator: FormValidators.compose(localizer, [
                FormValidators.required(),
                FormValidators.backendError(backendErrors.value, 'password')
              ]),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: StyledText(
                  'Forgot password?',
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  context.pushNamed(AppRoute.forgotPassword.name);
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 51,
              width: double.infinity,
              child: FilledButton(
                onPressed: isLoading.value ? null : () => login(),
                child: const StyledText('Sign in'),
              ),
            ),
            const SizedBox(height: 14),
            Platform.isAndroid && showGoogleBtn
                ? const LoginWithGoogleButton(SocialLoginProvider.google)
                : Container(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
