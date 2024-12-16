import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClearSearchFilterTile extends StatelessWidget {
  final String label;
  final bool filterIsActive;
  final VoidCallback onClear;

  const ClearSearchFilterTile({
    required this.label,
    required this.filterIsActive,
    required this.onClear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.close),
      title: StyledText(label, weight: FontWeight.w500),
      onTap: () {
        context.pop();
      },
      trailing: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: context.colorScheme.primary,
        ),
        onPressed: () {
          onClear();
          context.pop();
        },
        child: filterIsActive
            ? const StyledText('Clear')
            : const SizedBox.shrink(),
      ),
    );
  }
}
