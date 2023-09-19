import 'package:flutter/services.dart';
import 'package:flutter_internal_weather_app/core/models/positionIOS.dart';

class IOSNativeLocationManager {
  static const MethodChannel locationChannel =
      MethodChannel('flutter_internal_weather_app/location');

  static Future<PositionIOS> getCurrentPosition() async {
    final Map<dynamic, dynamic> result =
        await locationChannel.invokeMethod('getCurrentPosition');
    print(result);
    return PositionIOS.fromMap(result);
  }
}
