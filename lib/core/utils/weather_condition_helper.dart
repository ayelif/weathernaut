import 'package:flutter/material.dart';

IconData getWeatherIcon(String condition, {bool isDay = true}) {
  final c = condition.toLowerCase();
  if (c.contains('sunny') ||
      c.contains('clear') ||
      c.contains('güneşli') ||
      c.contains('açık')) {
    return isDay ? Icons.wb_sunny_rounded : Icons.nights_stay_rounded;
  }
  if (c.contains('thunder') || c.contains('storm') || c.contains('gök'))
    return Icons.thunderstorm_rounded;
  if (c.contains('rain') || c.contains('drizzle') || c.contains('yağmur'))
    return Icons.grain_rounded;
  if (c.contains('snow') || c.contains('kar') || c.contains('sleet'))
    return Icons.ac_unit_rounded;
  return Icons.wb_cloudy_rounded;
}

Color getWeatherIconColor(String condition, {bool isDay = true}) {
  final c = condition.toLowerCase();
  if (c.contains('sunny') || c.contains('clear') || c.contains('güneşli')) {
    return isDay ? Colors.amber : Colors.indigo;
  }
  if (c.contains('thunder') || c.contains('storm')) return Colors.deepPurple;
  if (c.contains('rain') || c.contains('drizzle') || c.contains('yağmur'))
    return Colors.blueAccent;
  if (c.contains('snow') || c.contains('kar')) return Colors.lightBlue;
  return Colors.blueGrey;
}
