import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RectShimmer extends StatelessWidget {
  final double width;
  final double height;

  const RectShimmer({required this.width, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade50,
      highlightColor: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade50,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.appTheme.buttonRadius),
          color: Colors.white,
        ),
      ),
    );
  }
}
