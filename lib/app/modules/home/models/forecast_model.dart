// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ForecastModel {
  String date;
  int max;
  int min;
  String windSpeedy;
  String weekday;
  String condition;

  ForecastModel({
    required this.date,
    required this.max,
    required this.min,
    required this.windSpeedy,
    required this.weekday,
    required this.condition,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'max': max,
      'min': min,
      'wind_speedy': windSpeedy,
      'weekday': weekday,
      'condition': condition,
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      date: map['date'] as String,
      max: map['max'] as int,
      min: map['min'] as int,
      windSpeedy: map['wind_speedy'] as String,
      weekday: map['weekday'] as String,
      condition: map['condition'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) =>
      ForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
