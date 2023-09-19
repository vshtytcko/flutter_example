import 'package:flutter_internal_weather_app/core/endpoints/weather_api_client.dart';

class LocationRepository {
  final WeatherApiClient weatherApiClient;
  LocationRepository({required this.weatherApiClient});

  Future<String> getCity(double latitude, double longitude) async {
    var cityName =
        await weatherApiClient.getCityNameFromLocation(latitude, longitude);

    return cityName;
  }
}
