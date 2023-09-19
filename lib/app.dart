import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/endpoints/weather_api_client.dart';
import 'package:flutter_internal_weather_app/core/repositories/location_repository.dart';
import 'package:flutter_internal_weather_app/core/utils/constants.dart';
import 'package:flutter_internal_weather_app/generated/l10n.dart';
import 'package:flutter_internal_weather_app/pages/history_search_city/bloc/history_search_city_bloc.dart';
import 'package:flutter_internal_weather_app/pages/history_search_city/view/history_search_city_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_internal_weather_app/app_routes.dart';
import 'package:flutter_internal_weather_app/core/bloc/navigator_bloc/navigator_bloc.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigatorBloc>(
            create: (_) => NavigatorBloc(navigatorKey: _navigatorKey)),
      ],
      child: AppView(navigatorKey: _navigatorKey),
    );
  }
}

class AppView extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AppView({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final AppRoutes appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      navigatorKey: context.read<NavigatorBloc>().navigatorKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: appRoutes.onGenerateRoute,
      routes: appRoutes.routes,
      home: RepositoryProvider(
        create: (context) => LocationRepository(
            weatherApiClient:
                WeatherApiClient(apiKey: Constants.apiKeyOpenWeatherMap)),
        child: BlocProvider<HistorySearchCityBloc>(
          create: (context) => HistorySearchCityBloc(
              locationRepository: context.read<LocationRepository>()),
          child: const HistorySearchCityPage(),
        ),
      ),
    );
  }
}
