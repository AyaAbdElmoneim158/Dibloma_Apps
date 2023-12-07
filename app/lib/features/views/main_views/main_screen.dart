import 'package:flutter/material.dart';
import '/features/views/main_views/widgets/custom_bottom_navigation_bar.dart';
import '/features/views/main_views/widgets/custom_page_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: const CustomPageView(),
    );
  }
}
