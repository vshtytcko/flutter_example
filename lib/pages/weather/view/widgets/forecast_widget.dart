import 'package:flutter/material.dart';
import 'package:flutter_internal_weather_app/core/models/weather.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';
import 'package:flutter_internal_weather_app/core/utils/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter_internal_weather_app/core/extension/string.dart';

class ForecastWidget extends StatelessWidget {
  final Weather weather;

  const ForecastWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        ListTile(
          leading: SizedBox(
            width: 120,
            child: Text(
              DateFormat('EEEE')
                  .format(DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![8].time * 1000,
                      isUtc: false))
                  .cap(),
              style: AppTextStyles.forecastDay,
            ),
          ),
          title: Center(
            child: Icon(weather.forecast![8].getIconData(),
                size: 28, color: AppColors.dayTextColor),
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('${weather.forecast![8].temperature.round()}˚',
                style: AppTextStyles.forecastDay),
            Container(
              width: 10,
            ),
            Text('${weather.forecast![12].temperature.round()}˚',
                style: AppTextStyles.forecastNight),
          ]),
        ),
        ListTile(
          leading: SizedBox(
            width: 120,
            child: Text(
              DateFormat('EEEE')
                  .format(DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![16].time * 1000,
                      isUtc: false))
                  .cap(),
              style: AppTextStyles.forecastDay,
            ),
          ),
          title: Center(
            child: Icon(weather.forecast![16].getIconData(),
                size: 28, color: AppColors.dayTextColor),
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('${weather.forecast![16].temperature.round()}˚',
                style: AppTextStyles.forecastDay),
            Container(
              width: 10,
            ),
            Text('${weather.forecast![20].temperature.round()}˚',
                style: AppTextStyles.forecastNight),
          ]),
        ),
        ListTile(
          leading: SizedBox(
            width: 120,
            child: Text(
              DateFormat('EEEE')
                  .format(DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![24].time * 1000,
                      isUtc: false))
                  .cap(),
              style: AppTextStyles.forecastDay,
            ),
          ),
          title: Icon(weather.forecast![24].getIconData(),
              size: 28, color: AppColors.dayTextColor),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('${weather.forecast![24].temperature.round()}˚',
                style: AppTextStyles.forecastDay),
            Container(
              width: 10,
            ),
            Text('${weather.forecast![28].temperature.round()}˚',
                style: AppTextStyles.forecastNight),
          ]),
        ),
        ListTile(
          leading: SizedBox(
            width: 120,
            child: Text(
              DateFormat('EEEE')
                  .format(DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![32].time * 1000,
                      isUtc: false))
                  .cap(),
              style: AppTextStyles.forecastDay,
            ),
          ),
          title: Icon(weather.forecast![32].getIconData(),
              size: 28, color: AppColors.dayTextColor),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('${weather.forecast![32].temperature.round()}˚',
                style: AppTextStyles.forecastDay),
            Container(
              width: 10,
            ),
            Text('${weather.forecast![36].temperature.round()}˚',
                style: AppTextStyles.forecastNight),
          ]),
        ),
        ListTile(
          leading: SizedBox(
            width: 120,
            child: Text(
              DateFormat('EEEE')
                  .format(DateTime.fromMillisecondsSinceEpoch(
                      weather.forecast![39].time * 1000,
                      isUtc: false))
                  .cap(),
              style: AppTextStyles.forecastDay,
            ),
          ),
          title: Icon(weather.forecast![39].getIconData(),
              size: 28, color: AppColors.dayTextColor),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('${weather.forecast![39].temperature.round()}˚',
                style: AppTextStyles.forecastDay),
            Container(
              width: 10,
            ),
            Text('${weather.forecast![39].temperature.round()}˚',
                style: AppTextStyles.forecastNight),
          ]),
        ),
      ],
    );
  }
}
