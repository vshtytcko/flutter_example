import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_weather_app/core/bloc/navigator_bloc/navigator_bloc.dart';
import 'package:flutter_internal_weather_app/core/utils/colors.dart';
import 'package:flutter_internal_weather_app/core/utils/screens.dart';
import 'package:flutter_internal_weather_app/generated/l10n.dart';
import 'package:flutter_internal_weather_app/pages/search/bloc/autocomplete_search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required String placeName}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundAppBarWeatherPage,
          centerTitle: true,
          title: Text(S.current.search),
        ),
        body: BlocBuilder<AutocompleteSearchBloc, AutocompleteSearchState>(
            builder: (context, AutocompleteSearchState searchState) {
          if (searchState is AutocompleteLoaded) {
            return SafeArea(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: S.current.hintYourCity,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          context
                              .read<AutocompleteSearchBloc>()
                              .add(LoadAutocomplete(searchInput: value));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: searchState.predictions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const CircleAvatar(
                              child: Icon(
                                Icons.pin_drop,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                                searchState.predictions[index].description!),
                            onTap: () {
                              context.read<NavigatorBloc>().add(Push(
                                  Screens.weather,
                                  searchState
                                      .predictions[index].terms?.first.value));
                              debugPrint(
                                  searchState.predictions[index].placeId);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (searchState is AutocompleteLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            );
          }
          return const Center(
            child: Text(
              'No places set',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          );
        }));
  }
}
