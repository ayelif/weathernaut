import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/core/utils/locale/locale_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/app/views/settings/widgets/settings_card.dart';

class LanguageSettingsCard extends StatelessWidget {
  const LanguageSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleBloc>().state.locale;

    return SettingsCard(
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
            context.read<LocaleBloc>().add(ChangeLocale(locale));
            final lang = locale == AppLocale.tr ? 'tr' : 'en';
            final homeState = context.read<HomeBloc>().state;
            final city = homeState is HomeLoaded ? homeState.city : 'Istanbul';
            context.read<HomeBloc>().add(LoadWeather(city, lang: lang));
          }
        },
      ),
    );
  }
}
