// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weatherapp/app/modules/home/models/forecast_model.dart';

class WeatherModel {
  int temp;
  String date;
  int humidity;
  String windSpeedy;
  String cityName;
  String conditionSlug;
  String currently;
  String description;
  List<ForecastModel> forecast;

  WeatherModel({
    required this.temp,
    required this.date,
    required this.humidity,
    required this.windSpeedy,
    required this.cityName,
    required this.forecast,
    required this.conditionSlug,
    required this.currently,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'date': date,
      'humidity': humidity,
      'wind_speedy': windSpeedy,
      'city_name': cityName,
      'condition_slug': conditionSlug,
      'currently': currently,
      'description': description,
      'forecast': forecast.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: map['temp'] as int,
      date: map['date'] as String,
      humidity: map['humidity'] as int,
      windSpeedy: map['wind_speedy'] as String,
      cityName: map['city_name'] as String,
      conditionSlug: map['condition_slug'] as String,
      currently: map['currently'] as String,
      description: map['description'] as String,
      forecast: List<ForecastModel>.from(
        (map['forecast'] as List).map<ForecastModel>(
          (x) => ForecastModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
