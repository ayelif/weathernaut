import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherAnimation extends StatelessWidget {
  final String condition;
  final double size;

  const WeatherAnimation({super.key, required this.condition, this.size = 80});

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
      return 'assets/animations/thunderstorm.json';
    } else if (c.contains('rain') ||
        c.contains('drizzle') ||
        c.contains('yağmur')) {
      return 'assets/animations/rainy.json';
    } else if (c.contains('snow') || c.contains('kar') || c.contains('sleet')) {
      return 'assets/animations/snowy.json';
    } else if (c.contains('cloud') ||
        c.contains('bulut') ||
        c.contains('overcast')) {
      return 'assets/animations/cloudy.json';
    }
    return 'assets/animations/cloudy.json';
  }

  @override
  Widget build(BuildContext context) {
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
