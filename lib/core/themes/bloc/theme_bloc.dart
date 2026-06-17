import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.system)) {
    on<LoadTheme>(_onLoadTheme);
    on<ChangeTheme>(_onChangeTheme);
  }

  void _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    final settingsBox = Hive.box(HiveBoxes.settings);
    final themeStr = settingsBox.get('themeMode', defaultValue: 'system') as String;
    
    ThemeMode themeMode;
    switch (themeStr) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      case 'system':
      default:
        themeMode = ThemeMode.system;
        break;
    }
    emit(ThemeState(themeMode));
  }

  void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    final settingsBox = Hive.box(HiveBoxes.settings);
    String themeStr;
    switch (event.themeMode) {
      case ThemeMode.light:
        themeStr = 'light';
        break;
      case ThemeMode.dark:
        themeStr = 'dark';
        break;
      case ThemeMode.system:
        themeStr = 'system';
        break;
    }
    settingsBox.put('themeMode', themeStr);
    emit(ThemeState(event.themeMode));
  }
}
