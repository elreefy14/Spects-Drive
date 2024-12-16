import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../i18n/styled_text.dart';

class IllustratedMessage extends StatelessWidget {
  final String title;
  final String assetPath;
  final String? message;
  final VoidCallback? onTryAgain;
  final bool compact;

  const IllustratedMessage({
    required this.title,
    required this.assetPath,
    this.message,
    this.onTryAgain,
    this.compact = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return SmallTryAgainButton(onTryAgain, title: title, message: message);
    } else {
      final children = <Widget>[];
      children.add(IndicatorIcon(assetPath));
      children.add(const SizedBox(height: 32));
      children.add(Title(title));
      if (message != null) {
        children.add(const SizedBox(height: 6));
        children.add(Subtitle(message!));
      }
      if (onTryAgain != null) {
        children.add(const SizedBox(height: 34));
        children.add(LargeTryAgainButton(onTryAgain!));
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }
  }
}

class IndicatorIcon extends StatelessWidget {
  final String assetPath;

  const IndicatorIcon(this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    if (assetPath.endsWith('svg')) {
      return SvgPicture.asset(assetPath, width: 74, height: 74);
    } else {
      return Image(image: AssetImage(assetPath), width: 74, height: 74);
    }
  }
}

class Title extends StatelessWidget {
  final String text;

  const Title(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return StyledText(text, style: Theme.of(context).textTheme.headlineSmall);
  }
}

class Subtitle extends StatelessWidget {
  final String text;

  const Subtitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return StyledText(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
      singleLine: false,
      align: TextAlign.center,
    );
  }
}

class SmallTryAgainButton extends StatelessWidget {
  final VoidCallback? onTryAgain;
  final String? title;
  final String? message;

  const SmallTryAgainButton(
    this.onTryAgain, {
    super.key,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      StyledText(
        message ?? title!,
        align: TextAlign.center,
      ),
      onTryAgain != null
          ? IconButton(icon: const Icon(Icons.refresh), onPressed: onTryAgain)
          : Container(),
    ]);
  }
}

class LargeTryAgainButton extends StatelessWidget {
  final VoidCallback onTryAgain;

  const LargeTryAgainButton(this.onTryAgain, {super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 244),
      child: FilledButton.icon(
        onPressed: onTryAgain,
        label: const StyledText('Try again'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
