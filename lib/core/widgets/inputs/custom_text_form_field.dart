import 'package:flutter/material.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFieldSubmitted;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted != null
            ? (_) => onFieldSubmitted!()
            : null,
        style: context.textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.brightness == Brightness.dark
                ? Colors.white38
                : Colors.black38,
          ),
          prefixIcon: Icon(prefixIcon, color: context.colorScheme.primary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
