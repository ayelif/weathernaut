import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/app/views/search/widgets/forecast_preview_list.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/utils/weather_condition_helper.dart';
import 'package:weathernaut/gen/strings.g.dart';

class CityPreviewSheet extends StatefulWidget {
  final Map<String, dynamic> cityData;
  final VoidCallback onSaved;

  const CityPreviewSheet({
    super.key,
    required this.cityData,
    required this.onSaved,
  });

  @override
  State<CityPreviewSheet> createState() => _CityPreviewSheetState();
}

class _CityPreviewSheetState extends State<CityPreviewSheet> {
  Map<String, dynamic>? _weather;
  Map<String, dynamic>? _forecast;
  bool _isLoading = true;
  bool _loaded = false;
  String? _error;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      _loadWeather();
    }
  }

  Future<void> _loadWeather() async {
    try {
      final repository = context.read<HomeBloc>().repository;
      final lang = TranslationProvider.of(context).locale == AppLocale.tr
          ? 'tr'
          : 'en';
      final weather = await repository.getCurrentWeather(
        widget.cityData['name'],
        lang: lang,
      );
      final forecast = await repository.getForecast(
        widget.cityData['name'],
        lang: lang,
      );
      setState(() {
        _weather = weather;
        _forecast = forecast;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.cityData['name'] ?? '';
    final country = widget.cityData['country'] ?? '';
    final lang = TranslationProvider.of(context).locale == AppLocale.tr
        ? 'tr'
        : 'en';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      country,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                if (_weather != null)
                  Text(
                    '${_weather!['current']['temp_c']}°',
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              )
            else if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red))
            else if (_weather != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildParam(
                      context,
                      getWeatherIcon(_weather!['current']['condition']['text']),
                      _weather!['current']['condition']['text'],
                    ),
                    _buildParam(
                      context,
                      Icons.water_drop_outlined,
                      '${_weather!['current']['humidity']}%',
                    ),
                    _buildParam(
                      context,
                      Icons.air_rounded,
                      '${_weather!['current']['wind_kph']} km/h',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_forecast != null)
                ForecastPreviewList(forecast: _forecast!, locale: lang),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Vazgeç'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onSaved();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Ekle'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildParam(BuildContext context, IconData icon, String value) {
    return Column(
      children: [
        Icon(icon, color: context.colorScheme.primary),
        const SizedBox(height: 4),
        Text(value, style: context.textTheme.bodyLarge?.copyWith(fontSize: 13)),
      ],
    );
  }
}
