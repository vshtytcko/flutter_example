import 'package:flutter/material.dart';
import 'package:flutter_internal_weather_app/core/models/weather.dart';
import 'package:flutter_internal_weather_app/core/utils/text_styles.dart';
import 'package:intl/intl.dart';

class TemperatureByTimeWidget extends StatelessWidget {
  final Weather weather;

  const TemperatureByTimeWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                DateFormat('h a').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![0].time * 1000,
                      isUtc: false),
                ),
                style: AppTextStyles.temperatureByTimeTop),
            Text('${weather.forecast![0].temperature.round()}˚',
                style: AppTextStyles.temperatureByTimeBottom)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                DateFormat('h a').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![1].time * 1000,
                      isUtc: false),
                ),
                style: AppTextStyles.temperatureByTimeTop),
            Text('${weather.forecast![1].temperature.round()}˚',
                style: AppTextStyles.temperatureByTimeBottom)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                DateFormat('h a').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![2].time * 1000,
                      isUtc: false),
                ),
                style: AppTextStyles.temperatureByTimeTop),
            Text('${weather.forecast![2].temperature.round()}˚',
                style: AppTextStyles.temperatureByTimeBottom)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                DateFormat('h a').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![3].time * 1000,
                      isUtc: false),
                ),
                style: AppTextStyles.temperatureByTimeTop),
            Text('${weather.forecast![3].temperature.round()}˚',
                style: AppTextStyles.temperatureByTimeBottom)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                DateFormat('h a').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![4].time * 1000,
                      isUtc: false),
                ),
                style: AppTextStyles.temperatureByTimeTop),
            Text('${weather.forecast![4].temperature.round()}˚',
                style: AppTextStyles.temperatureByTimeBottom)
          ],
        )
      ],
    );
  }
}
