// import 'package:flutter/material.dart';
// import 'package:flutter_internal_weather_app/core/utils/colors.dart';
// import 'package:flutter_internal_weather_app/generated/l10n.dart';

// class SearchBar extends StatelessWidget {
//   const SearchBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: TextField(
//         onSubmitted: (text) {
//           //some function from bloc with var text
//         },
//         autocorrect: false,
//         decoration: InputDecoration(
//             hintStyle: const TextStyle(color: AppColors.hintColor),
//             contentPadding: const EdgeInsets.all(10),
//             isDense: true,
//             filled: true,
//             fillColor: AppColors.backgroundSearchBar,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide.none),
//             hintText: S.current.searchCityWeather),
//         style: const TextStyle(
//           color: AppColors.textColor,
//         ),
//       ),
//     );
//   }
// }
