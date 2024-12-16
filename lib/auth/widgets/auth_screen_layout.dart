import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../i18n/styled_text.dart';
import '../../router_provider.dart';
import 'logo.dart';

class AuthScreenLayout extends StatelessWidget {
  final Widget title;
  final Widget child;
  final Widget? footer;

  const AuthScreenLayout({
    super.key,
    required this.title,
    required this.child,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
                child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                constraints: BoxConstraints(
                  maxWidth: min(
                    MediaQuery.of(context).size.width - 70,
                    450,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(),
                    const SizedBox(height: 60),
                    title,
                    const SizedBox(height: 20),
                    child,
                    const SizedBox(height: 10),
                    footer ?? const SizedBox.shrink(),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}

class LoginScreenFooter extends StatelessWidget {
  const LoginScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StyledText("Don't have an account?"),
        TextButton(
          child: StyledText('Sign up', color: Theme.of(context).primaryColor),
          onPressed: () {
            context.pushNamed(AppRoute.register.name);
          },
        )
      ],
    );
  }
}

class RegisterScreenFooter extends StatelessWidget {
  const RegisterScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StyledText('Already have an account?'),
        TextButton(
          child: StyledText('Sign in', color: Theme.of(context).primaryColor),
          onPressed: () {
            context.pushNamed(AppRoute.login.name);
          },
        )
      ],
    );
  }
}
