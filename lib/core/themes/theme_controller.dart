import 'package:flutter/material.dart';

class ThemeController {
  ThemeController._();
  static final instance = ThemeController._();

  final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.system);

  ThemeMode get themeMode => themeModeNotifier.value;

  void setThemeMode(ThemeMode mode) {
    themeModeNotifier.value = mode;
  }
}
