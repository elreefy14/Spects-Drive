import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Image(
      image: isDarkMode
          ? const AssetImage('assets/logos/logo-light.png')
          : const AssetImage('assets/logos/logo-dark.png'),
      height: 36.0,
    );
  }
}
