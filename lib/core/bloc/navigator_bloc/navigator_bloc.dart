import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_internal_weather_app/app_routes.dart';
import 'package:flutter_internal_weather_app/pages/common/animateless_route.dart';

part 'navigator_event.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;
  NavigatorBloc({required this.navigatorKey}) : super(null) {
    on<GoBack>(_onGoBack);
    on<Push>(_onPush);
    on<PushAndRemove>(_onPushAndremove);
    on<PushAndRemoveUntil>(_onPushAndRemoveUntil);
    on<PopUntil>(_onPopUntil);
  }

  void _onGoBack(GoBack event, Emitter emit) {
    navigatorKey.currentState!.pop();
  }

  void _onPush(Push event, Emitter emit) {
    if (event.params != null) {
      final routes = AppRoutes();
      final route = routes.named(event.routeName, event.params);
      final pageRoute = MaterialPageRoute(
          builder: route, settings: RouteSettings(name: event.routeName));
      navigatorKey.currentState!.push(pageRoute);
    } else {
      navigatorKey.currentState!.pushNamed(event.routeName);
    }
  }

  void _onPushAndremove(PushAndRemove event, Emitter emit) {
    final route = AppRoutes().routes[event.routeName];
    if (route == null) {
      return;
    }
    final PageRoute = event.animated
        ? MaterialPageRoute(
            builder: route, settings: RouteSettings(name: event.routeName))
        : AnimatelessMaterialPageRoute(
            builder: route, settings: RouteSettings(name: event.routeName));
    navigatorKey.currentState!.pushAndRemoveUntil(PageRoute, (route) => false);
  }

  void _onPushAndRemoveUntil(PushAndRemoveUntil event, Emitter emit) {
    if (event.params != null) {
      final routes = AppRoutes();
      final route = routes.named(event.routeName, event.params);
      final pageRoute = MaterialPageRoute(
          builder: route, settings: RouteSettings(name: event.routeName));
      navigatorKey.currentState!.pushAndRemoveUntil(pageRoute,
          (route) => route.settings.name == event.removeUntilRouteName);
    } else {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          event.routeName, ModalRoute.withName(event.removeUntilRouteName));
    }
  }

  void _onPopUntil(PopUntil event, Emitter emit) {
    navigatorKey.currentState!
        .popUntil((route) => route.settings.name == event.popUntilRouterName);
  }
}
