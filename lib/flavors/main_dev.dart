import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/app/app.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxes.cities);
  await Hive.openBox(HiveBoxes.settings);
  runApp(const WeathernautApp(environment: 'DEV'));
}
