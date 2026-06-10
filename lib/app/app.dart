import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/app/views/search/bloc/search_bloc.dart';
import 'package:weathernaut/core/data/repositories/weather_repository.dart';
import 'package:weathernaut/core/themes/app_theme.dart';
import 'package:weathernaut/core/themes/theme_controller.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/app/views/news/bloc/news_bloc.dart';
import 'package:weathernaut/core/data/repositories/news_repository.dart';

class WeathernautApp extends StatefulWidget {
  final String environment;

  const WeathernautApp({super.key, required this.environment});

  @override
  State<WeathernautApp> createState() => _WeathernautAppState();
}

class _WeathernautAppState extends State<WeathernautApp> {
  final _appRouter = AppRouter();
  late final HomeBloc _homeBloc;
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(WeatherRepository());
    _searchBloc = SearchBloc(WeatherRepository());
  }

  @override
  void dispose() {
    _homeBloc.close();
    _searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _homeBloc),
        BlocProvider.value(value: _searchBloc),
        BlocProvider(create: (_) => NewsBloc(NewsRepository())),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeController.instance.themeModeNotifier,
        builder: (context, currentThemeMode, child) {
          Widget app = TranslationProvider(
            child: Builder(
              builder: (context) {
                return MaterialApp.router(
                  title: 'Weathernaut',
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: currentThemeMode,
                  routerConfig: _appRouter.config(),
                  locale: TranslationProvider.of(context).locale.flutterLocale,
                  supportedLocales: AppLocaleUtils.supportedLocales,
                  localizationsDelegates: GlobalMaterialLocalizations.delegates,
                );
              },
            ),
          );

          if (widget.environment == 'DEV') {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Banner(
                message: 'DEV',
                location: BannerLocation.topEnd,
                color: Colors.orange,
                child: app,
              ),
            );
          }

          return app;
        },
      ),
    );
  }
}
