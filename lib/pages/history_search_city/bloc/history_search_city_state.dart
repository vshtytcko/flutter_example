part of 'history_search_city_bloc.dart';

class HistorySearchCityState extends Equatable {
  const HistorySearchCityState();

  @override
  List<Object?> get props => [];
}

class LocationLoading extends HistorySearchCityState {
  @override
  List<Object> get props => [];
}

class LocationLoaded extends HistorySearchCityState {
  final cityName;

  LocationLoaded({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

class LocationError extends HistorySearchCityState {
  final String errorCode;

  LocationError({required this.errorCode});

  @override
  List<Object> get props => [errorCode];
}
