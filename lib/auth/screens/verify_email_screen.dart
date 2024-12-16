import 'package:bedrive/i18n/localization_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../forms/form_validators.dart';
import '../../http/api_client_exception.dart';
import '../../i18n/styled_text.dart';
import '../auth_state_provider.dart';
import '../widgets/auth_screen_text_field.dart';
import '../widgets/logo.dart';

class VerifyEmailScreen extends HookConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider.notifier);
    final email = ref.watch(authStateProvider).requireValue!.email;
    final resendIsLoading = useState(false);

    Future<void> resendVerificationEmail() async {
      resendIsLoading.value = true;
      try {
        await auth.resendVerificationEmail();
        context.showTextSnackBar('Email sent');
      } on ApiClientException catch (e) {
        context.showErrorSnackBar(e.message);
      } finally {
        resendIsLoading.value = false;
      }
    }

    Future<void> logout() async {
      await auth.logout();
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 28, 14, 28),
                  child: Column(
                    children: [
                      StyledText(
                        'Verify your email',
                        style: context.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 20),
                      StyledText(
                        "Enter the verification code we sent to :email",
                        singleLine: false,
                        align: TextAlign.center,
                        style: context.textTheme.bodyLarge,
                        replacements: {'email': email},
                      ),
                      const SizedBox(height: 30),
                      OtpForm(),
                      const SizedBox(height: 20),
                      StyledText(
                        "If you don't see the email in your inbox, check your spam folder and promotions tab. If you still don't see it, request a resend with the button below.",
                        singleLine: false,
                        align: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: resendIsLoading.value
                                ? null
                                : resendVerificationEmail,
                            child: const StyledText('Resend email'),
                          ),
                          const SizedBox(width: 14),
                          OutlinedButton(
                            onPressed: logout,
                            child: const StyledText('Logout'),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpForm extends HookConsumerWidget {
  final _otpFormKey = GlobalKey<FormState>();

  OtpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final localizer = ref.watch(localizationProvider);
    final backendErrors = useState<Map<String, String>>({});
    final formPayload = useState<Map<String, String>>({});

    Future<void> validateOtp() async {
      backendErrors.value.clear();

      if (_otpFormKey.currentState!.validate()) {
        _otpFormKey.currentState!.save();
        try {
          isLoading.value = true;
          await ref
              .read(authStateProvider.notifier)
              .validateEmailVerificationOtp(formPayload.value['code']!);
        } on ApiClientException catch (e) {
          if (e.validationErrors != null) {
            backendErrors.value.addAll(e.validationErrors!);
            _otpFormKey.currentState!.validate();
          } else {
            context.showErrorSnackBar(e.message);
          }
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Form(
      key: _otpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AuthScreenTextField(
            label: localizer.translate('Code'),
            icon: const Icon(Icons.lock_outline),
            onSaved: (v) => formPayload.value['code'] = v!,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: FormValidators.compose(
              localizer,
              [
                FormValidators.required(),
                FormValidators.backendError(backendErrors.value, 'code')
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 51,
            width: double.infinity,
            child: FilledButton(
              onPressed: isLoading.value ? null : () => validateOtp(),
              child: const StyledText('Next'),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
