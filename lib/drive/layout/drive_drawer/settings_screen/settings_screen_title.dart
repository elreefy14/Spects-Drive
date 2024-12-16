import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';

class SettingsScreenTitle extends StatelessWidget {
  final String name;

  const SettingsScreenTitle({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: StyledText(
        name,
        style: context.textTheme.titleSmall!.copyWith(
          color: context.colorScheme.primary,
        ),
        uppercase: true,
      ),
    );
  }
}
