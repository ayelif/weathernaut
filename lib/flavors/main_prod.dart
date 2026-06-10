import 'package:flutter/material.dart';
import 'package:weathernaut/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeathernautApp(environment: 'PROD'));
}
