part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {}

class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String errorCode;

  WeatherError({required this.errorCode});

  @override
  List<Object> get props => [errorCode];
}
