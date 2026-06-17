import 'package:dio/dio.dart';
import 'package:weathernaut/core/data/network/api_constants.dart';

class NewsRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.newsBaseUrl));

  Future<List<dynamic>> getNewsByCity(String city, {String lang = 'en'}) async {
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': '$city AND (weather OR climate OR forecast)',
        'apiKey': ApiConstants.newsApiKey,
        'language': lang,
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }

  Future<List<dynamic>> getWeatherNews({String lang = 'en'}) async {
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': 'weather',
        'apiKey': ApiConstants.newsApiKey,
        'language': lang,
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }
}
