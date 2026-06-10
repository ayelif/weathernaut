import 'package:weathernaut/core/data/network/api_constants.dart';
import 'package:weathernaut/core/data/network/dio_client.dart';

class WeatherRepository {
  Future<Map<String, dynamic>> getCurrentWeather(
    String city, {
    String lang = 'en',
  }) async {
    final response = await DioClient.instance.get(
      ApiConstants.current,
      queryParameters: {'q': city, 'aqi': 'yes', 'lang': lang},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getForecast(
    String city, {
    int days = 7,
    String lang = 'en',
  }) async {
    final response = await DioClient.instance.get(
      ApiConstants.forecast,
      queryParameters: {'q': city, 'days': days, 'aqi': 'yes', 'lang': lang},
    );
    return response.data;
  }

  Future<List<dynamic>> searchCity(String query) async {
    final response = await DioClient.instance.get(
      ApiConstants.search,
      queryParameters: {'q': query},
    );
    return response.data;
  }
}
