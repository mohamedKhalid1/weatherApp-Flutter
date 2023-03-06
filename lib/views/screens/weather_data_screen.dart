import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/views/widgets/sun_animation_widget.dart';

import '../../controller/weather_provider.dart';
import '../../model/CurrentWeatherModels/current_weather_model.dart';
import '../widgets/search_widget.dart';
import '../widgets/weather_graph.dart';
import '../widgets/weather_hours.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentWeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF4255A6),
            elevation: 0,
          ),
          body: Provider.of<WeatherProvider>(context).weatherData == null ||
                  Provider.of<WeatherProvider>(context).weatherTemp == null
              ? const Center(
                  child: SunAnimationWidget(),
                  //CircularProgressIndicator.adaptive(),
                )
              : SingleChildScrollView(
                  child: Container(
                    //height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(-15583849),
                          Color(0xFF97ABFF),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SearchWidget(),
                          const SizedBox(height: 3),
                          Text(weatherData!.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Joan-Regular',
                                  fontWeight: FontWeight.w900)),
                          Text("${weatherData.mainModel.temp.toInt() - 273}°",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontFamily: 'Joan-Regular')),
                          const SizedBox(height: 3),
                          Text(weatherData.weatherModel.description,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Joan-Regular',
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'H: ${weatherData.mainModel.temp_max.toInt() - 273}°   L: ${weatherData.mainModel.temp_min.toInt() - 273}°',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Joan-Regular'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const WeatherHours(),
                          const SizedBox(
                            height: 10,
                          ),
                          WeatherGraph()
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
