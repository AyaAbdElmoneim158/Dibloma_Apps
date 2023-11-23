import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/core/router/routes.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.initialRoute,
      // home: const MainScreen(),
    );
  }
}
