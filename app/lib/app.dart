// import 'package:flutter/material.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final darkColorForLightTheme = 0xff242f60;

//   final lightColorForDarkTheme = 0xff03DAC5;

//   @override
//   Widget build(BuildContext context) {
//     var isDark = true;
//     var primaryColorHex = (isDark ? lightColorForDarkTheme : darkColorForLightTheme);
//     var primaryColor = Color(primaryColorHex);
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       theme: ThemeData.light().copyWith(
//         primaryColor: primaryColor,
//         brightness: Brightness.light,
//         backgroundColor: const Color(0xFFE5E5E5),
//         dividerColor: Colors.white54,
//         colorScheme: ColorScheme.light(primary: primaryColor),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text('Hello World'),
//               MaterialButton(
//                   color: primaryColor,
//                   onPressed: () {
//                     setState(() {
//                       isDark = !isDark;
//                     });
//                   },
//                   child: const Text('Change app primary color')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }