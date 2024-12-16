import 'dart:io';

import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../bootstrap/bootstrap_data_provider.dart';
import '../../forms/form_validators.dart';
import '../../http/api_client_exception.dart';
import '../../i18n/localization_provider.dart';
import '../../i18n/styled_text.dart';
import '../auth_state_provider.dart';
import '../widgets/auth_screen_layout.dart';
import '../widgets/auth_screen_text_field.dart';
import '../widgets/social_login_button.dart';

class RegisterScreen extends HookConsumerWidget {
  final _registerFormKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final isLoading = useState(false);
    final formPayload = useState<Map<String, String>>({});
    final backendErrors = useState<Map<String, String>>({});
    final bool showGoogleBtn = ref
        .watch(bootstrapDataProvider)
        .requireValue
        .settings
        .enableGoogleLogin;

    register() async {
      backendErrors.value.clear();
      if (_registerFormKey.currentState!.validate()) {
        _registerFormKey.currentState!.save();
        try {
          isLoading.value = true;
          await ref
              .read(authStateProvider.notifier)
              .register(formPayload.value);
        } on ApiClientException catch (e) {
          if (e.validationErrors != null) {
            backendErrors.value.addAll(e.validationErrors!);
            _registerFormKey.currentState!.validate();
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
        'Create a new account',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      footer: const RegisterScreenFooter(),
      child: Builder(
        builder: (BuildContext context) {
          return Form(
              key: _registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthScreenTextField(
                    label: localizer.translate('Email'),
                    icon: const Icon(Icons.email_outlined),
                    onSaved: (v) => formPayload.value['email'] = v!,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FormValidators.compose(localizer, [
                      FormValidators.required(),
                      FormValidators.email(),
                      FormValidators.backendError(backendErrors.value, 'email')
                    ]),
                  ),
                  const SizedBox(height: 14),
                  AuthScreenTextField(
                    onSaved: (v) => formPayload.value['password'] = v!,
                    obscureText: true,
                    icon: const Icon(Icons.lock_outlined),
                    label: localizer.translate('Password'),
                    textInputAction: TextInputAction.next,
                    validator: FormValidators.compose(localizer, [
                      FormValidators.required(),
                      FormValidators.backendError(
                          backendErrors.value, 'password')
                    ]),
                  ),
                  const SizedBox(height: 14),
                  AuthScreenTextField(
                    onSaved: (v) =>
                        formPayload.value['password_confirmation'] = v!,
                    obscureText: true,
                    icon: const Icon(Icons.lock),
                    label: localizer.translate('Confirm password'),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted:
                        isLoading.value ? null : (_) => register(),
                    validator: FormValidators.compose(localizer, [
                      FormValidators.required(),
                      FormValidators.backendError(
                          backendErrors.value, 'password_confirmation')
                    ]),
                  ),
                  const SizedBox(height: 34),
                  SizedBox(
                    height: 51,
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: isLoading.value ? null : () => register(),
                      child: const StyledText('Create account'),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Platform.isAndroid && showGoogleBtn
                      ? const LoginWithGoogleButton(SocialLoginProvider.google)
                      : Container(),
                  const SizedBox(height: 10),
                ],
              ));
        },
      ),
    );
  }
}
