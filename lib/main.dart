import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/controller/weather_provider.dart';
import 'package:weather_app2/views/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Joan-Regular',
      ),
      home: const HomeScreen(),
    );
  }
}
