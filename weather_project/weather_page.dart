import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_project_2/weather_model.dart';
import 'package:weather_project_2/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('12435bd5c4a571d6f6aef2a07085fad1');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

    //get weather for the city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/Sunny.json'; //default

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/Cloudy.json';

      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/Rainy.json';

      case 'thunderstorm':
        return 'assets/Thunder.json';

      case 'clear':
        return 'assets/Sunny.json';

      default:
        return 'assets/Sunny.json';
    }
  }

  //init state
  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city..."),

            //animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            Text("${_weather?.temperature.round()}°C"),

            //weather condition
            Text(_weather?.mainCondition ?? "")
          ],
        ),
      ),
    );
  }
}
