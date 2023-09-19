import 'package:flutter_internal_weather_app/core/utils/constants.dart';
import 'package:google_place/google_place.dart';

class GooglePlacesRepository {
  final GooglePlace googlePlace = GooglePlace(Constants.apiKeyGooglePlaces);

  Future<List<AutocompletePrediction>> getAutocomplete(
      String searchInput) async {
    List<AutocompletePrediction> predictions = [];

    var result = await googlePlace.autocomplete.get(searchInput);
    if (result != null && result.predictions != null) {
      predictions = result.predictions!;
    }

    return predictions;
  }
}
