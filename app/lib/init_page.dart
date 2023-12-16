// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '/core/utils/language_constants.dart';
// import '/features/model/language_model.dart';
// import '/main.dart';
// import 'package:country_flags/country_flags.dart';

// class InitPage extends StatelessWidget {
//   const InitPage({super.key});

//   String generateCountryFlag(String countryCode) {
//     // String countryCode = 'eg';

//     String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
//         (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

//     return flag;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Languages"),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownButton<LanguageModel>(
//               underline: const SizedBox(),
//               icon: const Icon(
//                 Icons.language,
//                 color: Colors.black,
//               ),
//               onChanged: (LanguageModel? language) async {
//                 if (language != null) {
//                   StoreApp.setLocale(context, await setLocale(language.languageCode));
//                 }
//               },
//               items: LanguageModel.languageList()
//                   .map<DropdownMenuItem<LanguageModel>>(
//                     (e) => DropdownMenuItem<LanguageModel>(
//                       value: e,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           Text(
//                             e.flag,
//                             style: const TextStyle(fontSize: 30),
//                           ),
//                           Text(e.name),
//                           Text(generateCountryFlag(e.languageCode)),
//                           CountryFlag.fromLanguageCode(
//                             e.languageCode,
//                             width: 50,
//                           ),
//                           // generateCountryFlag
//                         ],
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 AppLocalizations.of(context)!.settings,
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),

//               //! test TestStyles------------------------------------
//               //  Text("dj", style: Theme.of(context).textTheme.labelLarge,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
