import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/controller/weather_provider.dart';
import 'package:weather_app2/model/CurrentWeatherModels/current_weather_model.dart';
import 'package:weather_app2/model/fiveDaysModels/five_day_model.dart';
import 'package:weather_app2/model/weather_api.dart';

class SearchWidget extends StatelessWidget {
   String? cityName;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (data) {
        cityName = data;
      },
      onSubmitted: (data) async {
        cityName = data;

        CurrentWeatherModel? weather =
        await WeatherApi.getCurrentData(cityName: cityName!);

        Provider.of<WeatherProvider>(context, listen: false)
            .weatherData = weather;
        Provider.of<WeatherProvider>(context, listen: false)
            .cityName = cityName;

        // get data from provider of next five day

        FiveDayModel weatherTemp=await WeatherApi.getFiveDayTemp(cityName: cityName!);
        Provider.of<WeatherProvider>(context,listen: false).weatherTemp=weatherTemp;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
          suffixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white30,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Enter your city for search',
          hintStyle: const TextStyle(color: Colors.white,fontFamily: 'Joan-Regular')),
    );
  }
}
