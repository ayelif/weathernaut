import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';

class VibrationService {
  VibrationService._privateConstructor();

  static final VibrationService _instance = VibrationService._privateConstructor();

  factory VibrationService() {
    return _instance;
  }

  bool _isVibrating = false;

  bool get isImmersiveEnabled {
    final settingsBox = Hive.box(HiveBoxes.settings);
    return settingsBox.get('immersiveVibrations', defaultValue: true) as bool;
  }

  Future<void> vibrateForCondition(String condition) async {
    cancel();

    if (kIsWeb) return; // Haptic feedback is not supported/needed on web app
    if (!isImmersiveEnabled) return;

    try {
      final hasVibrator = await Vibration.hasVibrator();
      if (!hasVibrator) return;

      final c = condition.toLowerCase();

      // Map weather conditions to distinct vibration patterns
      if (c.contains('thunder') || c.contains('storm') || c.contains('gök')) {
        // Thunderstorm: Sudden, strong bursts with brief pauses
        _vibratePattern(
          pattern: [0, 400, 150, 600, 100, 300],
          intensities: [0, 255, 0, 255, 0, 180],
          repeat: -1,
        );
      } else if (c.contains('rain') || c.contains('sağanak') || c.contains('yağmur') || c.contains('drizzle')) {
        if (c.contains('light') || c.contains('patchy') || c.contains('hafif') || c.contains('çiseleyen') || c.contains('drizzle')) {
          // Light rain: Sparse, light tick-ticks (low intensity)
          _vibratePattern(
            pattern: [0, 20, 400, 15, 600, 20, 500],
            intensities: [0, 80, 0, 70, 0, 90, 0],
            repeat: -1,
          );
        } else {
          // Heavy/Normal rain: Dense, steady drops
          _vibratePattern(
            pattern: [0, 25, 120, 30, 180, 25, 150],
            intensities: [0, 125, 0, 140, 0, 115, 0],
            repeat: -1,
          );
        }
      } else if (c.contains('snow') || c.contains('kar') || c.contains('sleet')) {
        // Snowy: Very soft, far-apart ticks
        _vibratePattern(
          pattern: [0, 15, 1200, 15, 1500],
          intensities: [0, 50, 0, 60],
          repeat: -1,
        );
      } else if (c.contains('fog') || c.contains('mist') || c.contains('sis') || c.contains('pus') || c.contains('haze')) {
        // Foggy: Gentle, continuous low-frequency hum
        _vibratePattern(
          pattern: [0, 800, 400],
          intensities: [0, 50, 0],
          repeat: -1,
        );
      }
    } catch (e) {
      debugPrint('VibrationService Error: $e');
    }
  }

  void _vibratePattern({
    required List<int> pattern,
    required List<int> intensities,
    int repeat = -1,
  }) async {
    try {
      _isVibrating = true;
      final hasAmplitude = await Vibration.hasAmplitudeControl();

      if (hasAmplitude) {
        Vibration.vibrate(
          pattern: pattern,
          intensities: intensities,
          repeat: repeat,
        );
      } else {
        // Fallback for devices without custom amplitude control (just uses duration patterns)
        Vibration.vibrate(
          pattern: pattern,
          repeat: repeat,
        );
      }
    } catch (e) {
      debugPrint('VibrationService Pattern Error: $e');
    }
  }

  void cancel() {
    if (kIsWeb) return;
    try {
      if (_isVibrating) {
        Vibration.cancel();
        _isVibrating = false;
      }
    } catch (e) {
      debugPrint('VibrationService Cancel Error: $e');
    }
  }
}
