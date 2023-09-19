import 'dart:convert';
import 'package:flutter_internal_weather_app/core/endpoints/http_exception.dart';
import 'package:flutter_internal_weather_app/core/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'http://api.openweathermap.org';
  final apiKey;
  final metric = 'metric';

  WeatherApiClient({this.apiKey}) : assert(apiKey != null);

  Uri _buildUri(String endpoint, Map<String, dynamic> queryParameters) {
    var query = {
      'appid': apiKey,
      'units': metric,
    };
    if (queryParameters != null) {
      query = query..addAll(queryParameters);
    }

    var uri = Uri(
      scheme: 'http',
      host: 'api.openweathermap.org',
      path: 'data/2.5/$endpoint',
      queryParameters: query,
    );

    return uri;
  }

  Future<String> getCityNameFromLocation(
      double latitude, double longitude) async {
    final uri = _buildUri('weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw HTTPException(response.statusCode, "unable to fetch weather data");
    }

    final weatherJson = json.decode(response.body);
    return weatherJson['name'];
  }

  Future<Weather> getWeatherData(String cityName) async {
    final uri = _buildUri('weather', {'q': cityName});

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw HTTPException(response.statusCode, "unable to fetch weather data");
    }

    final weatherJson = json.decode(response.body);
    return Weather.fromJson(weatherJson);
  }

  Future<List<Weather>> getForecast(String cityName) async {
    final uri = _buildUri('forecast', {'q': cityName});

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw HTTPException(response.statusCode, "unable to fetch weather data");
    }

    final forecastJson = json.decode(response.body);
    List<Weather> weathers = Weather.fromForecastJson(forecastJson);
    return weathers;
  }
}
