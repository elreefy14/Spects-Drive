import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/router_provider.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../forms/form_validators.dart';
import '../../http/api_client_exception.dart';
import '../../i18n/localization_provider.dart';
import '../auth_state_provider.dart';
import '../widgets/auth_screen_layout.dart';
import '../widgets/auth_screen_text_field.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  final Map<String, String?> backendErrors = {};
  final _formKey = GlobalKey<FormState>();
  final Map<String, String?> formPayload = {};

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final isLoading = useState(false);
    final backendErrors = useState<Map<String, String>>({});
    final formPayload = useState<Map<String, String>>({});

    sendResetLink() async {
      backendErrors.value.clear();
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        try {
          isLoading.value = true;
          final message = await ref
              .read(authStateProvider.notifier)
              .sendResetPasswordLink(formPayload.value['email']!);
          context.showTextSnackBar(message ?? 'Email sent');
          context.pushReplacementNamed(AppRoute.login.name);
        } on ApiClientException catch (e) {
          if (e.validationErrors != null) {
            backendErrors.value.addAll(e.validationErrors!);
            _formKey.currentState!.validate();
          } else {
            context.showErrorSnackBar(e.message);
          }
        } finally {
          isLoading.value = false;
        }
      }
    }

    return AuthScreenLayout(
      title: const StyledText(
        'Enter your email address below and we will send you a link to reset or create your password.',
        singleLine: false,
        height: 1.2,
      ),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthScreenTextField(
                label: localizer.translate('Email'),
                icon: const Icon(Icons.email_outlined),
                onSaved: (v) => formPayload.value['email'] = v!,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: isLoading.value ? null : (_) => sendResetLink,
                validator: FormValidators.compose(localizer, [
                  FormValidators.required(),
                  FormValidators.email(),
                  FormValidators.backendError(backendErrors.value, 'email')
                ]),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 51,
                width: double.infinity,
                child: FilledButton(
                  onPressed: isLoading.value ? null : sendResetLink,
                  child: const StyledText('Continue'),
                ),
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }
}
