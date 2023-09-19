import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/models/weather.dart';
import 'package:flutter_internal_weather_app/core/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherLoading()) {
    on<FetchWeather>(((event, emit) async {
      emit(WeatherLoading());
      try {
        final Weather weather =
            await weatherRepository.getWeather(event.cityName);
        emit(WeatherLoaded(weather: weather));
      } catch (error) {
        emit(WeatherError(errorCode: error.toString()));
      }
    }));
  }
}
