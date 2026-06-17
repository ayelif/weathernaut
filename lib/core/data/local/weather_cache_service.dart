import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';

class WeatherCacheService {
  final Box _cacheBox = Hive.box(HiveBoxes.weatherCache);

  Future<void> saveWeather(String city, Map<String, dynamic> weather) async {
    await _cacheBox.put('weather_${city.toLowerCase()}', weather);
  }

  Future<void> saveForecast(String city, Map<String, dynamic> forecast) async {
    await _cacheBox.put('forecast_${city.toLowerCase()}', forecast);
  }

  Map<String, dynamic>? getCachedWeather(String city) {
    final data = _cacheBox.get('weather_${city.toLowerCase()}');
    if (data != null) {
      return Map<String, dynamic>.from(data as Map);
    }
    return null;
  }

  Map<String, dynamic>? getCachedForecast(String city) {
    final data = _cacheBox.get('forecast_${city.toLowerCase()}');
    if (data != null) {
      return Map<String, dynamic>.from(data as Map);
    }
    return null;
  }
}
