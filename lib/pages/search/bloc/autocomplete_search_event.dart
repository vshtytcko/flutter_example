part of 'autocomplete_search_bloc.dart';

abstract class AutocompleteSearchEvent extends Equatable {
  const AutocompleteSearchEvent();
}

class LoadAutocomplete extends AutocompleteSearchEvent {
  final String searchInput;

  const LoadAutocomplete({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}
