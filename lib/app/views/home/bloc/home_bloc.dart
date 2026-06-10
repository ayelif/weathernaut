import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/core/data/repositories/weather_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository repository;

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
      emit(HomeLoaded(weather: weather, forecast: forecast, city: cityName));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
