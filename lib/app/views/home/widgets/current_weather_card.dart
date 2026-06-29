import 'package:flutter/material.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/core/widgets/weather_animation.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Map<String, dynamic> weather;
  const CurrentWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final current = weather['current'];
    final temp = current?['temp_c']?.toString() ?? '--';
    final condition = current?['condition']?['text'] ?? '--';
    final humidity = current?['humidity']?.toString() ?? '--';
    final wind = current?['wind_kph']?.toString() ?? '--';
    final pressure = current?['pressure_mb']?.toString() ?? '--';
    final isDay = current?['is_day'] == 1;
    final isDarkTheme = context.theme.brightness == Brightness.dark;

    final cardColors = (isDay || !isDarkTheme)
        ? [
            context.colorScheme.primary.withOpacity(0.85),
            context.colorScheme.secondary.withOpacity(0.85),
          ]
        : [
            const Color(0xFF1E1B4B).withOpacity(0.9), // Deep indigo
            const Color(0xFF2E0854).withOpacity(0.9), // Dark violet/magenta
          ];

    final shadowColor = (isDay || !isDarkTheme)
        ? context.colorScheme.primary.withOpacity(0.2)
        : const Color(0xFF0F172A).withOpacity(0.4);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: cardColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          WeatherAnimation(condition: condition, size: 120, isDay: isDay),
          const SizedBox(height: 16),
          Text(
            condition,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$temp°',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildParam(
                context,
                icon: Icons.water_drop_outlined,
                label: context.t.home.humidity,
                value: '$humidity%',
              ),
              _buildParam(
                context,
                icon: Icons.air_rounded,
                label: context.t.home.wind,
                value: '$wind km/h',
              ),
              _buildParam(
                context,
                icon: Icons.speed_rounded,
                label: context.t.home.pressure,
                value: '$pressure hPa',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParam(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(height: 6),
        Text(
          label,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.white60,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
