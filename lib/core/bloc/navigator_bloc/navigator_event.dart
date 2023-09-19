part of 'navigator_bloc.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class GoBack extends NavigatorEvent {
  const GoBack();
}

class Push extends NavigatorEvent {
  final String routeName;
  final dynamic params;

  const Push(this.routeName, [this.params]);
  @override
  List<Object> get props => [routeName];
}

class PushAndRemove extends NavigatorEvent {
  final String routeName;
  final bool animated;

  const PushAndRemove(this.routeName, {bool? animated})
      : animated = animated ?? true;
  @override
  List<Object> get props => [routeName, animated];
}

class PushAndRemoveUntil extends NavigatorEvent {
  final String routeName;
  final String removeUntilRouteName;
  final dynamic params;

  const PushAndRemoveUntil(this.routeName, this.removeUntilRouteName,
      [this.params]);
  @override
  List<Object> get props => [routeName, removeUntilRouteName, params];
}

class PopUntil extends NavigatorEvent {
  final String popUntilRouterName;

  const PopUntil(this.popUntilRouterName);
  @override
  List<Object> get props => [popUntilRouterName];
}
