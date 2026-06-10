import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/gen/strings.g.dart';

class SavedCitiesList extends StatelessWidget {
  final List<String> cities;
  final Function(String) onCityRemoved;

  const SavedCitiesList({
    super.key,
    required this.cities,
    required this.onCityRemoved,
  });

  @override
  Widget build(BuildContext context) {
    if (cities.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          'Kaydedilen Şehirler',
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        ...cities.map((city) {
          return InkWell(
            onTap: () {
              final lang =
                  TranslationProvider.of(context).locale == AppLocale.tr
                  ? 'tr'
                  : 'en';
              context.read<HomeBloc>().add(LoadWeather(city, lang: lang));
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.surface.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.primary.withOpacity(0.05),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        city,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () => onCityRemoved(city),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
