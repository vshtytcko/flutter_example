import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/bloc/navigator_bloc/navigator_bloc.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';
import 'package:flutter_internal_weather_app/core/utils/screens.dart';
import 'package:flutter_internal_weather_app/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter_internal_weather_app/pages/weather/view/widgets/forecast_widget.dart';
import 'package:flutter_internal_weather_app/pages/weather/view/widgets/main_weather_widget.dart';
import 'package:flutter_internal_weather_app/pages/weather/view/widgets/temperature_by_time_widget.dart';
import 'package:flutter_internal_weather_app/core/extension/string.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  String cityName;
  WeatherPage({Key? key, required this.cityName}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchWeather(cityName: widget.cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarWeatherPage,
        centerTitle: true,
        title: Text(DateFormat('E, MMMM d').format(DateTime.now()).cap()),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                context.read<NavigatorBloc>().add(const Push(Screens.settings));
              },
              child: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundWeatherPage,
      body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, WeatherState weatherState) {
        if (weatherState is WeatherLoaded) {
          widget.cityName = weatherState.weather.cityName!;
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainWeatherWidget(weather: weatherState.weather),
                    Icon(weatherState.weather.getIconData(),
                        size: 150, color: AppColors.dayTextColor),
                  ],
                ),
              ),
              Container(
                height: 60,
                color: AppColors.backgroundWidgetWeatherByTime.withOpacity(0.3),
                child: TemperatureByTimeWidget(weather: weatherState.weather),
              ),
              Expanded(
                child: ForecastWidget(weather: weatherState.weather),
              ),
            ],
          );
        } else if (weatherState is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.indigo,
            ),
          );
        } else if (weatherState is WeatherError) {
          return Center(
            child: Text('Error ${weatherState.errorCode}'),
          );
        }
        return const Center(
          child: Text(
            'No city set',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        );
      }),
    );
  }
}
