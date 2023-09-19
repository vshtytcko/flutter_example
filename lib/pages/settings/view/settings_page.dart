import 'package:flutter/material.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarWeatherPage,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings page'),
      ),
    );
  }
}
