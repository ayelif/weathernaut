part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadWeather extends HomeEvent {
  final String city;
  final String lang;
  LoadWeather(this.city, {this.lang = 'en'});
}
