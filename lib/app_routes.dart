import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/endpoints/weather_api_client.dart';
import 'package:flutter_internal_weather_app/core/repositories/google_places_repository.dart';
import 'package:flutter_internal_weather_app/core/repositories/location_repository.dart';
import 'package:flutter_internal_weather_app/core/repositories/weather_repository.dart';
import 'package:flutter_internal_weather_app/core/utils/constants.dart';
import 'package:flutter_internal_weather_app/core/utils/screens.dart';
import 'package:flutter_internal_weather_app/pages/history_search_city/bloc/history_search_city_bloc.dart';
import 'package:flutter_internal_weather_app/pages/history_search_city/view/history_search_city_page.dart';
import 'package:flutter_internal_weather_app/pages/search/bloc/autocomplete_search_bloc.dart';
import 'package:flutter_internal_weather_app/pages/search/view/search_page.dart';
import 'package:flutter_internal_weather_app/pages/settings/view/settings_page.dart';
import 'package:flutter_internal_weather_app/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter_internal_weather_app/pages/weather/view/weather_page.dart';

class AppRoutes {
  Route<dynamic>? Function(RouteSettings)? get onGenerateRoute =>
      (_) => HistorySearchCityPage.route();

  Widget Function(BuildContext) named(String name, dynamic params) {
    switch (name) {
      case Screens.weather:
        return (context) => RepositoryProvider(
            create: (context) => WeatherRepository(
                weatherApiClient:
                    WeatherApiClient(apiKey: Constants.apiKeyOpenWeatherMap)),
            child: BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc(
                    weatherRepository: context.read<WeatherRepository>()),
                child: WeatherPage(cityName: params)));
      default:
        return (context) => const HistorySearchCityPage();
    }
  }

  Map<String, Widget Function(BuildContext)> get routes => {
        Screens.settings: (context) => const SettingsPage(),
        Screens.search: (context) => RepositoryProvider(
              create: (context) => GooglePlacesRepository(),
              child: BlocProvider<AutocompleteSearchBloc>(
                create: (context) => AutocompleteSearchBloc(
                    googlePlacesRepository:
                        context.read<GooglePlacesRepository>()),
                child: const SearchPage(placeName: ''),
              ),
            ),
        Screens.history: (context) => RepositoryProvider(
              create: (context) => LocationRepository(
                  weatherApiClient:
                      WeatherApiClient(apiKey: Constants.apiKeyOpenWeatherMap)),
              child: BlocProvider<HistorySearchCityBloc>(
                create: (context) => HistorySearchCityBloc(
                    locationRepository: context.read<LocationRepository>()),
                child: const HistorySearchCityPage(),
              ),
            ),
      };
}
