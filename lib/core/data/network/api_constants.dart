class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String apiKey = 'd049d8666dfb4cc5a05130417262905';

  // Weather Endpoints
  static const String current = '/current.json';
  static const String forecast = '/forecast.json';
  static const String search = '/search.json';

  // News
  static const String newsBaseUrl = 'https://newsapi.org/v2';
  static const String newsApiKey = '04fb17d694814ae88f3b174a04fe376d';
  static const String newsEverything = '/everything';
}
