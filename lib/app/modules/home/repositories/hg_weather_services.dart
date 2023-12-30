// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weatherapp/app/modules/home/models/city_model.dart';
import 'package:weatherapp/app/modules/home/models/weather_model.dart';

class HGWeatherRepository {
  final String? baseURL = dotenv.env["BASE_URL"];
  final String? apiKey = dotenv.env["API_KEY"];

  final Dio dio;

  HGWeatherRepository({required this.dio});

  Future<WeatherModel> getWeather({required City city}) async {
    var url =
        "$baseURL?array_limit=7&fields=only_results,temp,currently,description,humidity,wind_speedy,city_name,condition_slug,forecast,max,min,weekday,condition,date&key=$apiKey&lat=${city.lat}&lon=${city.lon}";
    final response = await dio.get(url);

    late WeatherModel weatherModel;

    if (response.statusCode == 200) {
      weatherModel = WeatherModel.fromMap(response.data);
      //debugPrint(weatherModel.toJson());
    }

    return weatherModel;
  }
}
