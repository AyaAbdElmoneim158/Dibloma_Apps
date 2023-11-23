import 'package:flutter/material.dart';
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
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.initialRoute,
    );
  }
}
