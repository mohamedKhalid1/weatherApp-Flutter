import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/controller/weather_provider.dart';
import 'package:weather_app2/model/CurrentWeatherModels/current_weather_model.dart';
import 'package:weather_app2/views/widgets/search_widget.dart';
import 'package:weather_app2/views/widgets/weather_graph.dart';
import 'package:weather_app2/views/widgets/weather_hours.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;

  @override
  @override
  Widget build(BuildContext context) {
    CurrentWeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
        body: Provider.of<WeatherProvider>(context).weatherData == null ||
                Provider.of<WeatherProvider>(context).weatherTemp == null
            ? Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/backgroud.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                'My friend, you can now search for the weather in your city, in addition to some features, the weather for the next seven times, and compare them through the graph\n',
                                style: TextStyle(
                                    fontSize: 18,
                                    wordSpacing: 5,
                                    fontFamily: 'Joan-Regular'),
                              ),
                              Center(
                                  child: Text('💚💛🤍',
                                      style: TextStyle(fontSize: 25))),
                            ],
                          ),
                        ),
                        Expanded( child: SearchWidget()),
                      ],
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/backgroud.jpg'),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SearchWidget(),
                        const SizedBox(height: 3),
                        Text(weatherData!.name,
                            style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'Joan-Regular',
                                fontWeight: FontWeight.w900)),
                        Text("${weatherData.mainModel.temp.toInt() - 273}°",
                            style: const TextStyle(
                                fontSize: 50, fontFamily: 'Joan-Regular')),
                        const SizedBox(height: 3),
                        Text(weatherData.weatherModel.description,
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Joan-Regular',
                                fontWeight: FontWeight.bold)),
                        Text(
                          'H: ${weatherData.mainModel.temp_max.toInt() - 273}°   L: ${weatherData.mainModel.temp_min.toInt() - 273}°',
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'Joan-Regular'),
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
              ));
  }
}
