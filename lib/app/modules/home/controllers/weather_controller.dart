import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/models/city_model.dart';
import 'package:weatherapp/app/modules/home/models/weather_model.dart';
import 'package:weatherapp/app/modules/home/repositories/hg_weather_services.dart';

class WeatherController extends GetxController {
  final HGWeatherRepository repository;

  WeatherModel? _weatherModel;
  WeatherModel? get weatherModel => _weatherModel;

  final RxBool _isloading = false.obs;
  RxBool get isLoading => _isloading;

  WeatherController({required this.repository});

  getWeather({required City city}) async {
    _isloading.value = true;

    final response = await repository.getWeather(city: city);

    _weatherModel = response;

    _isloading.value = false;
  }
}
