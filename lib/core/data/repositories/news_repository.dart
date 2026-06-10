import 'package:dio/dio.dart';
import 'package:weathernaut/core/data/network/api_constants.dart';

class NewsRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.newsBaseUrl));

  Future<List<dynamic>> getNewsByCity(String city) async {
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': '$city AND (weather OR climate OR forecast)',
        'apiKey': ApiConstants.newsApiKey,
        'language': 'en',
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }

  Future<List<dynamic>> getWeatherNews() async {
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': 'weather',
        'apiKey': ApiConstants.newsApiKey,
        'language': 'en',
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }
}
