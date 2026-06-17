import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weathernaut/app/app.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxes.cities);
  await Hive.openBox(HiveBoxes.settings);
  await Hive.openBox(HiveBoxes.weatherCache);
  runApp(const WeathernautApp(environment: 'PROD'));
}
