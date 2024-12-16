import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';

class SearchFilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isActive;
  final Widget label;

  const SearchFilterButton({
    required this.onPressed,
    required this.isActive,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isActive ? context.colorScheme.primary.withOpacity(0.1) : null,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive) const Icon(Icons.check, size: 16),
            if (isActive) const SizedBox(width: 8),
            label,
            const SizedBox(width: 6),
            const Icon(Icons.arrow_drop_down, size: 16),
          ],
        ),
      ),
    );
  }
}
