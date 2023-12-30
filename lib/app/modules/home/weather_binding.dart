import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/weather_controller.dart';
import 'package:weatherapp/app/modules/home/repositories/hg_weather_services.dart';

setUpWeather() {
  Get.put<WeatherController>(
    WeatherController(
      repository: HGWeatherRepository(
        dio: Dio(),
      ),
    ),
  );
}
