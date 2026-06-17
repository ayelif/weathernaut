import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/core/data/repositories/weather_repository.dart';
import 'package:weathernaut/core/data/local/weather_cache_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository repository;
  final WeatherCacheService _cacheService = WeatherCacheService();

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadWeather>(_onLoadWeather);
  }

  Future<void> _onLoadWeather(
    LoadWeather event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final weather = await repository.getCurrentWeather(
        event.city,
        lang: event.lang,
      );
      final forecast = await repository.getForecast(
        event.city,
        lang: event.lang,
      );
      final cityName = weather['location']?['name'] ?? event.city;
      
      await _cacheService.saveWeather(cityName, weather);
      await _cacheService.saveForecast(cityName, forecast);
      
      if (cityName.toLowerCase() != event.city.toLowerCase()) {
        await _cacheService.saveWeather(event.city, weather);
        await _cacheService.saveForecast(event.city, forecast);
      }

      emit(HomeLoaded(
        weather: weather,
        forecast: forecast,
        city: cityName,
        isOffline: false,
      ));
    } catch (e) {
      final cachedWeather = _cacheService.getCachedWeather(event.city);
      final cachedForecast = _cacheService.getCachedForecast(event.city);
      if (cachedWeather != null && cachedForecast != null) {
        final cityName = cachedWeather['location']?['name'] ?? event.city;
        emit(HomeLoaded(
          weather: cachedWeather,
          forecast: cachedForecast,
          city: cityName,
          isOffline: true,
        ));
      } else {
        emit(HomeError(e.toString()));
      }
    }
  }
}
