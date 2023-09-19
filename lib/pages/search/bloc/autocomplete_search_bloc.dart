import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/repositories/google_places_repository.dart';
import 'package:google_place/google_place.dart';

part 'autocomplete_search_event.dart';
part 'autocomplete_search_state.dart';

class AutocompleteSearchBloc
    extends Bloc<AutocompleteSearchEvent, AutocompleteSearchState> {
  final GooglePlacesRepository googlePlacesRepository;

  AutocompleteSearchBloc({required this.googlePlacesRepository})
      : super(AutocompleteLoaded(predictions: const [])) {
    on<LoadAutocomplete>(((event, emit) async {
      try {
        final List<AutocompletePrediction> predictions =
            await googlePlacesRepository.getAutocomplete(event.searchInput);
        emit(AutocompleteLoaded(predictions: predictions));
      } catch (error) {
        emit(AutocompleteError(errorCode: error.toString()));
      }
    }));
  }
}
