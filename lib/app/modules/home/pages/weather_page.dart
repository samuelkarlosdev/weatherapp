import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/weather_controller.dart';
import 'package:weatherapp/app/modules/home/models/city_model.dart';
import 'package:weatherapp/app/modules/home/weather_binding.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherController _controller;

  @override
  void initState() {
    setUpWeather();
    _controller = Get.find<WeatherController>();

    /*_controller.getWeather(
      city: City(lat: "-5.08921", lon: "-42.8016", name: "Teresina"),
    );*/
    _controller.getWeather(
      city: City(lat: "-23.5489", lon: "-46.6388", name: "São Paulo"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Obx(
        () {
          return _controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : _controller.weatherModel == null
                  ? const Center(
                      child: Text(
                        'Nenhuma previsão encontrada!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: _controller.weatherModel!.currently == "dia"
                              ? const AssetImage("assets/background_day.png")
                              : const AssetImage("assets/background_night.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            /*-------- CIDADE / TEMPO ----------- */

                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _controller.weatherModel!.cityName,
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${_controller.weatherModel!.temp}°C',
                                            style: const TextStyle(
                                              fontSize: 70,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                "assets/${_controller.weatherModel!.conditionSlug}.png"),
                                            width: 100,
                                            height: 100,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          _controller.weatherModel!.description,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /*-------- UMIDADE / VENTO ----------- */

                            Expanded(
                              flex: 2,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(125, 198, 250, 100),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Umidade",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '${_controller.weatherModel!.humidity} mm',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Vento",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          _controller.weatherModel!.windSpeedy,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /*-------- PREVISÃO POR HORA ----------- */

                            /*const Text(
                              "PREVISÃO POR HORA",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 4,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    50,
                                    (index) => Container(
                                      margin: const EdgeInsets.all(6),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.white, // Set border color
                                            width: 1.0), // Set border width
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "13:00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Image(
                                            image:
                                                AssetImage("assets/daylight.png"),
                                            width: 30,
                                            height: 30,
                                          ),
                                          Text(
                                            "25°C",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            */

                            /*-------- PRÓXIMOS DIAS ----------- */

                            const Text(
                              "PRÓXIMOS DIAS",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _controller
                                            .weatherModel!.forecast[index].date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "assets/${_controller.weatherModel!.forecast[index].condition}.png"),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        'min ${_controller.weatherModel!.forecast[index].min}°C',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'max ${_controller.weatherModel!.forecast[index].min}°C',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                itemCount:
                                    _controller.weatherModel!.forecast.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
