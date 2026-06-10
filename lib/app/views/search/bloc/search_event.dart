part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchCity extends SearchEvent {
  final String query;
  SearchCity(this.query);
}

class SelectCity extends SearchEvent {
  final String city;
  SelectCity(this.city);
}
