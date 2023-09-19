import 'package:flutter/material.dart';
import 'package:flutter_internal_weather_app/core/utils/converters.dart';
import 'package:flutter_internal_weather_app/core/utils/weather_icon_mapper.dart';

class Weather {
  int? id;
  int time;
  int? sunrise;
  int? sunset;
  int? humidity;

  String? main;
  String? description;
  String iconCode;
  String? cityName;
  String? country;

  double? windSpeed;

  double temperature;
  double? feelsLikeTemperature;
  double? maxTemperature;
  double? minTemperature;

  List<Weather>? forecast;
  //MARK: For converter from kelvin to celsius or fahrenheit:
  // Temperature temperature;
  // Temperature? feelsLikeTemperature;
  // Temperature? maxTemperature;
  // Temperature? minTemperature;

  Weather({
    this.id,
    required this.time,
    this.sunrise,
    this.sunset,
    this.humidity,
    this.main,
    this.description,
    required this.iconCode,
    this.cityName,
    this.country,
    this.windSpeed,
    required this.temperature,
    this.feelsLikeTemperature,
    this.maxTemperature,
    this.minTemperature,
    this.forecast,
  });

  static Weather fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    return Weather(
      time: json['dt'],
      id: weather['id'],
      description: weather['description'],
      iconCode: weather['icon'],
      main: weather['main'],
      //MARK: for the convert of temperature in future
      // temperature: Temperature(intToDouble(json['main']['temp'])),
      // feelsLikeTemperature:
      //     Temperature(intToDouble(json['main']['feels_like'])),
      // maxTemperature: Temperature(intToDouble(json['main']['temp_max'])),
      // minTemperature: Temperature(intToDouble(json['main']['temp_min'])),
      temperature: intToDouble(json['main']['temp']),
      feelsLikeTemperature: intToDouble(json['main']['feels_like']),
      maxTemperature: intToDouble(json['main']['temp_max']),
      minTemperature: intToDouble(json['main']['temp_min']),
      humidity: json['main']['humidity'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      country: json['sys']['country'],
      windSpeed: intToDouble(json['wind']['speed']),
      cityName: json['name'],
    );
  }

  static List<Weather> fromForecastJson(Map<String, dynamic> json) {
    final weathers = <Weather>[];
    for (final item in json['list']) {
      weathers.add(Weather(
          time: item['dt'],
          temperature: intToDouble(item['main']['temp']),
          iconCode: item['weather'][0]['icon']));
    }
    return weathers;
  }

  IconData getIconData() {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.clear_day;
      case '01n':
        return WeatherIcons.clear_night;
      case '02d':
        return WeatherIcons.few_clouds_day;
      case '02n':
        return WeatherIcons.few_clouds_day;
      case '03d':
      case '04d':
        return WeatherIcons.clouds_day;
      case '03n':
      case '04n':
        return WeatherIcons.clear_night;
      case '09d':
        return WeatherIcons.shower_rain_day;
      case '09n':
        return WeatherIcons.shower_rain_night;
      case '10d':
        return WeatherIcons.rain_day;
      case '10n':
        return WeatherIcons.rain_night;
      case '11d':
        return WeatherIcons.thunder_storm_day;
      case '11n':
        return WeatherIcons.thunder_storm_night;
      case '13d':
        return WeatherIcons.snow_day;
      case '13n':
        return WeatherIcons.snow_night;
      case '50d':
        return WeatherIcons.mist_day;
      case '50n':
        return WeatherIcons.mist_night;
      default:
        return WeatherIcons.clear_day;
    }
  }
}
