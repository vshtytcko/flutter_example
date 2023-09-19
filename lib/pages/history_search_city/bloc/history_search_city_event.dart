part of 'history_search_city_bloc.dart';

abstract class HistorySearchCityEvent extends Equatable {
  const HistorySearchCityEvent();

  @override
  List<Object> get props => [];
}

class FetchLocation extends HistorySearchCityEvent {
  final double longitude;
  final double latitude;

  const FetchLocation(this.longitude, this.latitude);

  @override
  List<Object> get props => [longitude, latitude];
}
