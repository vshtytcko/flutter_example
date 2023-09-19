class PositionIOS {
  final double latitude;
  final double longitude;

  PositionIOS({
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return 'Latitude: $latitude, Longitude: $longitude';
  }

  /// Converts the supplied [Map] to an instance of the [Position] class.
  static PositionIOS fromMap(dynamic message) {
    final Map<dynamic, dynamic> positionMap = message;

    if (!positionMap.containsKey('latitude')) {
      throw ArgumentError.value(positionMap, 'positionMap',
          'The supplied map doesn\'t contain the mandatory key `latitude`.');
    }

    if (!positionMap.containsKey('longitude')) {
      throw ArgumentError.value(positionMap, 'positionMap',
          'The supplied map doesn\'t contain the mandatory key `longitude`.');
    }

    return PositionIOS(
      latitude: positionMap['latitude'],
      longitude: positionMap['longitude'],
    );
  }

  /// Converts the [Position] instance into a [Map] instance that can be
  /// serialized to JSON.
  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
      };
}
