import 'package:flutter_internal_weather_app/core/endpoints/weather_api_client.dart';
import 'package:flutter_internal_weather_app/core/models/weather.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;
  WeatherRepository({required this.weatherApiClient});

  Future<Weather> getWeather(String cityName) async {
    var weather = await weatherApiClient.getWeatherData(cityName);
    var weathers = await weatherApiClient.getForecast(cityName);
    weather.forecast = weathers;

    return weather;
  }
}
