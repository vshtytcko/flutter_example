import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/repositories/location_repository.dart';

part 'history_search_city_event.dart';
part 'history_search_city_state.dart';

class HistorySearchCityBloc
    extends Bloc<HistorySearchCityEvent, HistorySearchCityState> {
  final LocationRepository locationRepository;

  HistorySearchCityBloc({required this.locationRepository})
      : super(LocationLoading()) {
    on<FetchLocation>(((event, emit) async {
      emit(LocationLoading());
      try {
        final String city =
            await locationRepository.getCity(event.latitude, event.longitude);
        emit(LocationLoaded(cityName: city));
      } catch (error) {
        emit(LocationError(errorCode: error.toString()));
      }
    }));
  }
}
