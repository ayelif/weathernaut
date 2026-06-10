import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/core/data/repositories/weather_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WeatherRepository _repository;

  SearchBloc(this._repository) : super(SearchInitial()) {
    on<SearchCity>(_onSearchCity);
    on<SelectCity>(_onSelectCity);
  }

  Future<void> _onSearchCity(
    SearchCity event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.length < 2) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      final results = await _repository.searchCity(event.query);
      emit(SearchLoaded(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> _onSelectCity(
    SelectCity event,
    Emitter<SearchState> emit,
  ) async {
    // Seçilen şehri HomeBloc'a iletmek için kullanılacak
  }
}
