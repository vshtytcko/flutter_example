part of 'autocomplete_search_bloc.dart';

abstract class AutocompleteSearchState extends Equatable {}

class AutocompleteLoading extends AutocompleteSearchState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AutocompleteLoaded extends AutocompleteSearchState {
  List<AutocompletePrediction> predictions = [];

  AutocompleteLoaded({required this.predictions});

  @override
  List<Object?> get props => [predictions];
}

class AutocompleteError extends AutocompleteSearchState {
  final String errorCode;

  AutocompleteError({required this.errorCode});

  @override
  List<Object?> get props => [errorCode];
}
