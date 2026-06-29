import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/core/data/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _repository;

  NewsBloc(this._repository) : super(NewsInitial()) {
    on<LoadNews>(_onLoadNews);
  }

  Future<void> _onLoadNews(LoadNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final results = await Future.wait([
        _repository.getNewsByCity(event.city, lang: event.lang),
        _repository.getGeneralNewsByCity(event.city, lang: event.lang),
      ]);

      final weatherArticles = results[0];
      final generalArticles = results[1];

      final Map<String, dynamic> uniqueArticles = {};
      for (var article in weatherArticles) {
        final key = article['url'] ?? article['title'] ?? '';
        if (key.isNotEmpty) uniqueArticles[key] = article;
      }
      for (var article in generalArticles) {
        final key = article['url'] ?? article['title'] ?? '';
        if (key.isNotEmpty && !uniqueArticles.containsKey(key)) {
          uniqueArticles[key] = article;
        }
      }

      var mergedArticles = uniqueArticles.values.toList();

      if (mergedArticles.isEmpty) {
        mergedArticles = await _repository.getWeatherNews(lang: event.lang);
      }

      emit(NewsLoaded(mergedArticles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
