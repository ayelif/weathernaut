import 'package:flutter/material.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/utils/weather_condition_helper.dart';

class HourlyForecastList extends StatelessWidget {
  final Map<String, dynamic> forecast;
  const HourlyForecastList({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final forecastDays = forecast['forecast']?['forecastday'] as List?;
    final todayHours =
        (forecastDays != null && forecastDays.isNotEmpty
            ? forecastDays[0]['hour'] as List?
            : null) ??
        [];
    final tomorrowHours =
        (forecastDays != null && forecastDays.length > 1
            ? forecastDays[1]['hour'] as List?
            : null) ??
        [];

    final currentHour = DateTime.now().hour;
    final todayFiltered = todayHours.where((hour) {
      final timeStr = hour['time']?.toString().split(' ').last ?? '00:00';
      final hourInt = int.tryParse(timeStr.split(':').first) ?? 0;
      return hourInt >= currentHour;
    }).toList();

    final hours = [...todayFiltered, ...tomorrowHours];

    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: hours.length > 12 ? 12 : hours.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final hour = hours[index];
          final time = hour['time']?.toString().split(' ').last ?? '--';
          final temp = hour['temp_c']?.toString() ?? '--';
          final isDay = hour['is_day'] == 1;
          final condition = hour['condition']?['text'] ?? '';
          final isActive = index == 0;

          return Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: isActive
                  ? context.colorScheme.primary
                  : context.colorScheme.surface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive
                    ? Colors.transparent
                    : context.colorScheme.primary.withOpacity(0.05),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  time,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: isActive ? Colors.white70 : Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  getWeatherIcon(condition, isDay: isDay),
                  color: isActive
                      ? Colors.white
                      : getWeatherIconColor(condition, isDay: isDay),
                  size: 28,
                ),
                Text(
                  '$temp°',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: isActive ? Colors.white : null,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
