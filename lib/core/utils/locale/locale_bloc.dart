import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/gen/strings.g.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState(LocaleSettings.currentLocale)) {
    on<LoadLocale>(_onLoadLocale);
    on<ChangeLocale>(_onChangeLocale);
  }

  void _onLoadLocale(LoadLocale event, Emitter<LocaleState> emit) {
    final settingsBox = Hive.box(HiveBoxes.settings);
    final langStr = settingsBox.get('languageCode');
    
    AppLocale locale;
    if (langStr == 'en') {
      locale = AppLocale.en;
    } else if (langStr == 'tr') {
      locale = AppLocale.tr;
    } else {
      locale = LocaleSettings.currentLocale;
    }
    
    LocaleSettings.setLocale(locale);
    emit(LocaleState(locale));
  }

  void _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) {
    final settingsBox = Hive.box(HiveBoxes.settings);
    final langStr = event.locale == AppLocale.en ? 'en' : 'tr';
    settingsBox.put('languageCode', langStr);
    LocaleSettings.setLocale(event.locale);
    emit(LocaleState(event.locale));
  }
}
