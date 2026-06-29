import 'package:flutter/material.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';

class BackgroundView extends StatelessWidget {
  final Widget child;
  final List<Color>? customColors;
  final bool? isDay;

  const BackgroundView({
    super.key,
    required this.child,
    this.customColors,
    this.isDay,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.theme.brightness == Brightness.dark;
    final defaultColors = isDarkTheme
        ? (isDay ?? true
            ? [const Color(0xFF0F172A), const Color(0xFF020617)]
            : [const Color(0xFF0B1528), const Color(0xFF040812)])
        : [const Color(0xFFE0F2FE), const Color(0xFFF8FAFC)];

    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: customColors ?? defaultColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
