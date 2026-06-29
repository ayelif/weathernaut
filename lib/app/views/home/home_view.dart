import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/app/views/home/widgets/current_weather_card.dart';
import 'package:weathernaut/app/views/home/widgets/daily_forecast_list.dart';
import 'package:weathernaut/app/views/home/widgets/hourly_forecast_list.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/base/dashboard_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/core/data/location_service.dart';
import 'package:weathernaut/core/services/vibration_service.dart';
import 'package:weathernaut/app/views/home/widgets/home_app_bar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TabsRouter? _tabsRouter;
  VoidCallback? _routerListener;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<HomeBloc>();
    if (bloc.state is HomeInitial) {
      _loadWeatherForCurrentLocation(bloc);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      final newRouter = AutoTabsRouter.of(context);
      if (_tabsRouter != newRouter) {
        if (_tabsRouter != null && _routerListener != null) {
          _tabsRouter!.removeListener(_routerListener!);
        }
        _tabsRouter = newRouter;
        _routerListener = () {
          if (_tabsRouter!.activeIndex != 0) {
            VibrationService().cancel();
          } else {
            _triggerVibrationForCurrentState();
          }
        };
        _tabsRouter!.addListener(_routerListener!);
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    if (_tabsRouter != null && _routerListener != null) {
      _tabsRouter!.removeListener(_routerListener!);
    }
    VibrationService().cancel();
    super.dispose();
  }

  void _triggerVibrationForCurrentState() {
    final state = context.read<HomeBloc>().state;
    if (state is HomeLoaded && (_tabsRouter == null || _tabsRouter!.activeIndex == 0)) {
      final current = state.weather['current'];
      final condition = current?['condition']?['text'] ?? '';
      VibrationService().vibrateForCondition(condition);
    }
  }

  Future<void> _loadWeatherForCurrentLocation(HomeBloc bloc) async {
    final lang = LocaleSettings.currentLocale == AppLocale.tr ? 'tr' : 'en';
    try {
      final city = await LocationService().getCurrentCity();
      bloc.add(LoadWeather(city, lang: lang));
    } catch (e) {
      bloc.add(LoadWeather('Istanbul', lang: lang));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          _triggerVibrationForCurrentState();
        } else {
          VibrationService().cancel();
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is HomeError) {
            return Scaffold(body: Center(child: Text(state.message)));
          }
          final current = state is HomeLoaded ? state.weather['current'] : null;
          final isDay = current?['is_day'] != 0;

          return BackgroundView(
            isDay: isDay,
            child: DashboardView(
              appBar: HomeAppBar(
                city: state is HomeLoaded ? state.city : 'Istanbul',
              ),
              children: [
                if (state is HomeLoaded) ...[
                  if (state.isOffline) ...[
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.cloud_off_rounded,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              TranslationProvider.of(context).locale == AppLocale.tr
                                  ? 'Çevrimdışı Mod: Önbellekteki veriler gösteriliyor.'
                                  : 'Offline Mode: Displaying cached data.',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.amber.shade800,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  CurrentWeatherCard(weather: state.weather),
                  const SizedBox(height: 24),
                  Text(
                    context.t.home.hourlyForecast,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  HourlyForecastList(forecast: state.forecast),
                  const SizedBox(height: 24),
                  Text(
                    context.t.home.dailyForecast,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DailyForecastList(
                    forecast: state.forecast,
                    locale: TranslationProvider.of(context).locale == AppLocale.tr
                        ? 'tr'
                        : 'en',
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          );
        },
      ),
    );
  }


}
