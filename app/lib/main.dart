import 'package:flutter/material.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/app_strings.dart';

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
      theme: ThemeData(fontFamily: AppStrings.fontFamily),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.initialRoute,
    );
  }
}
