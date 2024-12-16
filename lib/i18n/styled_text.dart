import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'localization_provider.dart';

class StyledText extends ConsumerWidget {
  final String data;
  final TextStyle? style;
  final bool singleLine;
  final Color? color;
  final bool capitalize;
  final bool uppercase;
  final bool translate;
  final double? size;
  final FontWeight? weight;
  final double? height;
  final TextAlign? align;
  final Map<String, dynamic>? replacements;

  const StyledText(
    this.data, {
    super.key,
    this.style,
    this.singleLine = true,
    this.color,
    this.size,
    this.capitalize = false,
    this.uppercase = false,
    this.translate = true,
    this.weight,
    this.height,
    this.align,
    this.replacements,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String transformedData = data;

    if (capitalize) {
      transformedData =
          transformedData[0].toUpperCase() + transformedData.substring(1);
    }

    if (uppercase) {
      transformedData = transformedData.toUpperCase();
    }

    if (translate) {
      transformedData = ref
          .watch(localizationProvider)
          .translate(transformedData, replacements);
    }

    return Text(
      transformedData,
      softWrap: !singleLine,
      overflow: TextOverflow.fade,
      textAlign: align,
      style: style ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
            height: height,
          ),
    );
  }
}
