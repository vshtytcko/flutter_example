import 'package:flutter/material.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';

class AppTextStyles {
  static const TextStyle cityName = TextStyle(
      fontSize: 26, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle mainTemperature = TextStyle(
      fontSize: 60, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle weatherDescription = TextStyle(
      fontSize: 22, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle temperature = TextStyle(
      fontSize: 14, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle temperatureByTimeTop = TextStyle(
      fontSize: 16, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle temperatureByTimeBottom = TextStyle(
      fontSize: 20, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle forecastDay = TextStyle(
      fontSize: 18, color: AppColors.dayTextColor, fontWeight: FontWeight.w500);

  static const TextStyle forecastNight = TextStyle(
      fontSize: 18,
      color: AppColors.nightTextColor,
      fontWeight: FontWeight.w500);
}
