import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app2/constants.dart';
import 'package:weather_app2/controller/weather_provider.dart';
import 'package:weather_app2/model/fiveDaysModels/five_day_model.dart';

class WeatherGraph extends StatefulWidget {
  @override
  State<WeatherGraph> createState() => _WeatherGraphState();
  late int i=i+1;
}

class _WeatherGraphState extends State<WeatherGraph> {
  late List <WeatherData> _graphData;
  WeatherData? weather;

  @override
  void initState() {
   // _graphData = Provider.of<WeatherProvider>(context).getGraphData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? cityName=Provider.of<WeatherProvider>(context).cityName;
    return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          height: MediaQuery
              .of(context)
              .size
              .height * 0.4,
              child: SfCartesianChart(
                  title: ChartTitle(text: 'Comparison of the weather for the next 24 hours for $cityName'),
                  //legend: Legend(isVisible: true),
                  series: <ChartSeries>[
                    LineSeries<WeatherData, int>(
                      dataSource: Provider.of<WeatherProvider>(context).getGraphData(),
                      xValueMapper: (WeatherData weather, _) => weather.hours,
                      yValueMapper: (WeatherData weather, _) => weather.temp,
                    )]),
          ));
  }
}

class WeatherData {
  WeatherData(this.hours, this.temp);

  final int hours;
  final int temp;

}