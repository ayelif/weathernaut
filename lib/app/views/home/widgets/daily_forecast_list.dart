import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/utils/weather_condition_helper.dart';

class DailyForecastList extends StatelessWidget {
  final Map<String, dynamic> forecast;
  final String locale;

  const DailyForecastList({
    super.key,
    required this.forecast,
    this.locale = 'en',
  });

  @override
  Widget build(BuildContext context) {
    final days = (forecast['forecast']?['forecastday'] as List?) ?? [];

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.05),
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: days.length,
        separatorBuilder: (_, __) => Divider(
          color: context.colorScheme.primary.withOpacity(0.05),
          height: 1,
        ),
        itemBuilder: (context, index) {
          final day = days[index];
          final rawDate = day['date']?.toString() ?? '';
          final date = rawDate.isNotEmpty
              ? DateFormat('EEE, d MMM', locale).format(DateTime.parse(rawDate))
              : '--';
          final maxTemp = day['day']?['maxtemp_c']?.toString() ?? '--';
          final minTemp = day['day']?['mintemp_c']?.toString() ?? '--';
          final condition = day['day']?['condition']?['text'] ?? '--';

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    date,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                Icon(
                  getWeatherIcon(condition),
                  color: getWeatherIconColor(condition),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    condition,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '$maxTemp° / $minTemp°',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
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
