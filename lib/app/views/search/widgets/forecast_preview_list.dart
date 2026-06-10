import 'package:flutter/material.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:intl/intl.dart';

class ForecastPreviewList extends StatelessWidget {
  final Map<String, dynamic> forecast;
  final String locale;

  const ForecastPreviewList({
    super.key,
    required this.forecast,
    this.locale = 'en',
  });
  @override
  Widget build(BuildContext context) {
    final days = forecast['forecast']['forecastday'] as List;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '7 Günlük Tahmin',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: days.asMap().entries.map((entry) {
              final index = entry.key;
              final day = entry.value;
              final rawDate = day['date'] ?? '';
              final date = rawDate.isNotEmpty
                  ? DateFormat(
                      'EEE, d MMM',
                      locale,
                    ).format(DateTime.parse(rawDate))
                  : '';
              final max = day['day']['maxtemp_c'];
              final min = day['day']['mintemp_c'];
              final condition = day['day']['condition']['text'] ?? '';
              final isLast = index == days.length - 1;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            date,
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          condition,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '$max° / $min°',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      color: context.colorScheme.primary.withOpacity(0.05),
                      height: 1,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
