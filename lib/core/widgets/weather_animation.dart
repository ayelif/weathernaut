import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weathernaut/core/widgets/night_sky_animation.dart';

class WeatherAnimation extends StatelessWidget {
  final String condition;
  final double size;
  final bool isDay;

  const WeatherAnimation({
    super.key,
    required this.condition,
    this.size = 80,
    this.isDay = true,
  });

  String _getAnimationPath(String condition) {
    final c = condition.toLowerCase();
    if (c.contains('sunny') ||
        c.contains('clear') ||
        c.contains('güneşli') ||
        c.contains('açık')) {
      return 'assets/animations/sunny.json';
    } else if (c.contains('partly') || c.contains('parçalı')) {
      return 'assets/animations/partly_cloudy.json';
    } else if (c.contains('thunder') ||
        c.contains('gök') ||
        c.contains('storm')) {
      if (c.contains('rain') || c.contains('yağmur') || c.contains('sağanak')) {
        return 'assets/animations/thunder_rain.json';
      }
      return 'assets/animations/thunderstorm.json';
    } else if (c.contains('rain') ||
        c.contains('sağanak') ||
        c.contains('yağmur') ||
        c.contains('drizzle')) {
      if (c.contains('light') ||
          c.contains('patchy') ||
          c.contains('hafif') ||
          c.contains('çiseleyen') ||
          c.contains('drizzle')) {
        return 'assets/animations/light_rain.json';
      }
      return 'assets/animations/rainy.json';
    } else if (c.contains('snow') || c.contains('kar') || c.contains('sleet')) {
      return 'assets/animations/snowy.json';
    } else if (c.contains('fog') ||
        c.contains('mist') ||
        c.contains('sis') ||
        c.contains('pus') ||
        c.contains('haze')) {
      return 'assets/animations/foggy.json';
    } else if (c.contains('cloud') ||
        c.contains('bulut') ||
        c.contains('overcast')) {
      return 'assets/animations/cloudy.json';
    }
    return 'assets/animations/cloudy.json';
  }

  @override
  Widget build(BuildContext context) {
    final c = condition.toLowerCase();
    final isClear = c.contains('sunny') ||
        c.contains('clear') ||
        c.contains('güneşli') ||
        c.contains('açık');
    final isPartlyCloudy = c.contains('partly') || c.contains('parçalı');

    if (!isDay) {
      if (isClear) {
        return NightSkyAnimation(size: size);
      }
      if (isPartlyCloudy) {
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: NightSkyAnimation(size: size * 0.75),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Lottie.asset(
                  'assets/animations/cloudy.json',
                  width: size * 0.85,
                  height: size * 0.85,
                  fit: BoxFit.contain,
                  options: LottieOptions(enableMergePaths: true),
                ),
              ),
            ],
          ),
        );
      }
    }

    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        _getAnimationPath(condition),
        width: size,
        height: size,
        fit: BoxFit.contain,
        options: LottieOptions(enableMergePaths: true),
        delegates: LottieDelegates(
          values: [
            ValueDelegate.color(const [
              '**',
              'Rectangle',
              '**',
            ], value: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
