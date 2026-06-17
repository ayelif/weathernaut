part of 'news_bloc.dart';

abstract class NewsEvent {}

class LoadNews extends NewsEvent {
  final String city;
  final String lang;
  LoadNews(this.city, {this.lang = 'en'});
}
