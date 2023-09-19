import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/bloc/navigator_bloc/navigator_bloc.dart';
import 'package:flutter_internal_weather_app/core/models/positionIOS.dart';
import 'package:flutter_internal_weather_app/core/repositories/IOSNativeLocationManager.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';
import 'package:flutter_internal_weather_app/core/utils/screens.dart';
import 'package:flutter_internal_weather_app/generated/l10n.dart';
import 'package:flutter_internal_weather_app/pages/history_search_city/bloc/history_search_city_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HistorySearchCityPage extends StatefulWidget {
  const HistorySearchCityPage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const HistorySearchCityPage());
  }

  @override
  State<StatefulWidget> createState() => HistorySearchCityPageState();
}

class HistorySearchCityPageState extends State<HistorySearchCityPage> {
  late HistorySearchCityBloc _locationBloc;

  @override
  void initState() {
    super.initState();
    _locationBloc = BlocProvider.of<HistorySearchCityBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBarWeatherPage,
        title: Text(S.current.searchHistory),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
              title: const Text('Minsk'),
              leading: const Icon(Icons.location_city),
              trailing: const Icon(Icons.arrow_forward),
              selectedColor: Colors.grey,
              onTap: () {
                context
                    .read<NavigatorBloc>()
                    .add(const Push(Screens.weather, 'Minsk'));
              }),
          ListTile(
            title: const Text('New York'),
            leading: const Icon(Icons.location_city),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              context
                  .read<NavigatorBloc>()
                  .add(const Push(Screens.weather, 'New York'));
            },
          ),
          ListTile(
            title: const Text('Delhi'),
            leading: const Icon(Icons.location_city),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              context
                  .read<NavigatorBloc>()
                  .add(const Push(Screens.weather, 'Delhi'));
            },
          ),
          ListTile(
            title: const Text('Vilnius'),
            leading: const Icon(Icons.location_city),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              context
                  .read<NavigatorBloc>()
                  .add(const Push(Screens.weather, 'Vilnius'));
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          BlocBuilder<HistorySearchCityBloc, HistorySearchCityState>(
              builder: (context, HistorySearchCityState locationState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: null,
                backgroundColor: AppColors.backgroundButton,
                foregroundColor: AppColors.foregroundButton,
                child: const Icon(Icons.my_location),
                onPressed: () {
                  _fetchWeatherWithLocation();
                  if (locationState is LocationLoaded) {
                    context
                        .read<NavigatorBloc>()
                        .add(Push(Screens.weather, locationState.cityName));
                  }
                }),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
                heroTag: null,
                backgroundColor: AppColors.backgroundButton,
                foregroundColor: AppColors.foregroundButton,
                child: const Icon(Icons.search),
                onPressed: () {
                  context.read<NavigatorBloc>().add(const Push(Screens.search));
                }),
          ],
        );
      }),
    );
  }

  _fetchWeatherWithLocation() async {
    var permissionResult = await Permission.locationWhenInUse.status;

    switch (permissionResult) {
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        print('location permission denied');
        _showLocationDeniedDialog();
        break;

      case PermissionStatus.denied:
        await Permission.locationWhenInUse.request();
        _fetchWeatherWithLocation();
        break;

      case PermissionStatus.limited:
      case PermissionStatus.granted:
        if (Platform.isIOS) {
          print('It is iOS platform');
          PositionIOS positionIOS =
              await IOSNativeLocationManager.getCurrentPosition();
          print(positionIOS);
          _locationBloc
              .add(FetchLocation(positionIOS.longitude, positionIOS.latitude));
        } else {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low,
              timeLimit: const Duration(seconds: 1));

          print(position.toString());

          _locationBloc
              .add(FetchLocation(position.longitude, position.latitude));
        }
        break;
    }
  }

  void _showLocationDeniedDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Location is disabled :(',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  elevation: 1,
                ),
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                child: const Text('Enable!'),
              ),
            ],
          );
        });
  }
}
