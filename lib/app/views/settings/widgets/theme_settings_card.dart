import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/core/themes/bloc/theme_bloc.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/app/views/settings/widgets/settings_card.dart';

class ThemeSettingsCard extends StatelessWidget {
  const ThemeSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = context.watch<ThemeBloc>().state.themeMode;

    return SettingsCard(
      icon: Icons.dark_mode_rounded,
      title: context.t.settings.theme,
      child: DropdownButton<ThemeMode>(
        value: currentThemeMode,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        items: [
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(context.t.settings.systemTheme),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(context.t.settings.lightMode),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(context.t.settings.darkMode),
          ),
        ],
        onChanged: (mode) {
          if (mode != null) {
            context.read<ThemeBloc>().add(ChangeTheme(mode));
          }
        },
      ),
    );
  }
}
