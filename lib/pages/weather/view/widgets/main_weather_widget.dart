import 'package:flutter/material.dart';
import 'package:flutter_internal_weather_app/core/models/weather.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';
import 'package:flutter_internal_weather_app/core/utils/text_styles.dart';

class MainWeatherWidget extends StatelessWidget {
  final Weather weather;

  const MainWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.cityName!,
          style: AppTextStyles.cityName,
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '${weather.temperature.round()}˚',
              style: AppTextStyles.mainTemperature,
            ),
            Row(children: [
              Icon(Icons.keyboard_arrow_up, color: AppColors.secondTextColor),
              Text(
                '${weather.maxTemperature!.round()}˚',
                style: AppTextStyles.temperature,
              ),
              Icon(Icons.keyboard_arrow_down, color: AppColors.secondTextColor),
              Text(
                '${weather.minTemperature!.round()}˚',
                style: AppTextStyles.temperature,
              )
            ]),
          ]),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.main!,
                style: AppTextStyles.weatherDescription,
              ),
              Text(
                'Feels like ${weather.feelsLikeTemperature!.round()}˚',
                style: AppTextStyles.temperature,
              )
            ],
          ),
        ),
      ],
    );
  }
}
