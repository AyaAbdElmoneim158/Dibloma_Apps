import 'package:flutter/material.dart';
import 'package:todo_app/src/views/main/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_app/src/views/main/widgets/custom_page_view.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: const CustomPageView(),
    );
  }
}
