import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/controller/weather_provider.dart';
import 'package:weather_app2/views/screens/weather_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return WeatherProvider();
  },
  child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Joan-Regular',
      ),
      home: WeatherScreen(),

    );
  }
}