import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreenTextField extends ConsumerWidget {
  final String label;
  final Icon icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;

  const AuthScreenTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onSaved,
    required this.validator,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: icon,
        labelText: label,
      ),
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
