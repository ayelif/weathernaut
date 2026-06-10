part of 'news_bloc.dart';

abstract class NewsEvent {}

class LoadNews extends NewsEvent {
  final String city;
  LoadNews(this.city);
}
