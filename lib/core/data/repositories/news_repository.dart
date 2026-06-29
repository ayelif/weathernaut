import 'package:dio/dio.dart';
import 'package:weathernaut/core/data/network/api_constants.dart';

class NewsRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.newsBaseUrl));

  Future<List<dynamic>> getNewsByCity(String city, {String lang = 'en'}) async {
    final queryKeywords = lang == 'tr'
        ? '(hava durumu OR iklim OR tahmin OR fırtına OR yağış)'
        : '(weather OR climate OR forecast)';
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': '$city AND $queryKeywords',
        'apiKey': ApiConstants.newsApiKey,
        'language': lang,
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }

  Future<List<dynamic>> getGeneralNewsByCity(String city, {String lang = 'en'}) async {
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': city,
        'apiKey': ApiConstants.newsApiKey,
        'language': lang,
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }

  Future<List<dynamic>> getWeatherNews({String lang = 'en'}) async {
    final queryKeyword = lang == 'tr' ? 'hava durumu' : 'weather';
    final response = await _dio.get(
      ApiConstants.newsEverything,
      queryParameters: {
        'q': queryKeyword,
        'apiKey': ApiConstants.newsApiKey,
        'language': lang,
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );
    return response.data['articles'] ?? [];
  }
}
