part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Map<String, dynamic> weather;
  final Map<String, dynamic> forecast;
  final String city;
  final bool isOffline;
  HomeLoaded({
    required this.weather,
    required this.forecast,
    required this.city,
    this.isOffline = false,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
