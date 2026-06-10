import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/base/dashboard_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/themes/theme_controller.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _isCelsius = true;

  @override
  Widget build(BuildContext context) {
    final currentLocale = TranslationProvider.of(context).locale;

    return BackgroundView(
      child: DashboardView(
        appBar: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12),
          child: Row(
            children: [
              Text(
                context.t.settings.title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
        children: [
          // Units Settings Card
          _buildSettingsCard(
            context,
            icon: Icons.thermostat_rounded,
            title: context.t.settings.units,
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('°C'),
                  selected: _isCelsius,
                  onSelected: (val) {
                    setState(() {
                      _isCelsius = true;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('°F'),
                  selected: !_isCelsius,
                  onSelected: (val) {
                    setState(() {
                      _isCelsius = false;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Theme Settings Card (Dropdown to choose Light, Dark, or System)
          _buildSettingsCard(
            context,
            icon: Icons.dark_mode_rounded,
            title: context.t.settings.theme,
            child: DropdownButton<ThemeMode>(
              value: ThemeController.instance.themeMode,
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
                  setState(() {
                    ThemeController.instance.setThemeMode(mode);
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 16),

          // Language Settings Card
          _buildSettingsCard(
            context,
            icon: Icons.language_rounded,
            title: context.t.settings.language,
            child: DropdownButton<AppLocale>(
              value: currentLocale,
              underline: const SizedBox(),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              items: [
                DropdownMenuItem(
                  value: AppLocale.en,
                  child: Text(context.t.settings.english),
                ),
                DropdownMenuItem(
                  value: AppLocale.tr,
                  child: Text(context.t.settings.turkish),
                ),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  LocaleSettings.setLocale(locale);
                  final lang = locale == AppLocale.tr ? 'tr' : 'en';
                  final homeState = context.read<HomeBloc>().state;
                  final city = homeState is HomeLoaded
                      ? homeState.city
                      : 'Istanbul';
                  context.read<HomeBloc>().add(LoadWeather(city, lang: lang));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.05),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: context.colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
