import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/app/app_widget.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const AppWidget());
}
