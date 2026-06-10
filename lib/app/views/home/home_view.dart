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
import 'package:intl/intl.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/core/data/location_service.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<HomeBloc>();
    if (bloc.state is HomeInitial) {
      _loadWeatherForCurrentLocation(bloc);
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is HomeError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }
        return BackgroundView(
          child: DashboardView(
            appBar: _buildAppBar(
              context,
              state is HomeLoaded ? state.city : 'Istanbul',
            ),
            children: [
              if (state is HomeLoaded) ...[
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
    );
  }

  Widget _buildAppBar(BuildContext context, String city) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                DateFormat(
                  'EEEE, d MMM',
                  TranslationProvider.of(context).locale == AppLocale.tr
                      ? 'tr'
                      : 'en',
                ).format(DateTime.now()),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.surface.withOpacity(0.8),
            ),
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
