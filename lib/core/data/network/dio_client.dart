import 'package:dio/dio.dart';
import 'api_constants.dart';

class DioClient {
  DioClient._();

  static Dio get instance => _dio;

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {'key': ApiConstants.apiKey},
    ),
  );
}
