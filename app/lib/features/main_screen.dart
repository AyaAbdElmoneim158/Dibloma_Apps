// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/category/category_screen.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/profile/profile_screen.dart';
import 'package:todo_app/features/search/search_screen.dart';
import 'package:todo_app/features/wish/wish_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 4;
  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    WishScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildMainScreen(),
      body: screens[currentIndex],
    );
  }

  Container _buildMainScreen() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -4),
              spreadRadius: 0,
              blurRadius: 16,
              color: const Color(0xffBAB0CE).withOpacity(0.2))
        ],
      ),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        items: items(),
        currentIndex: currentIndex,
        unselectedItemColor: AppColors.grayFontColor,
        onTap: (value) => setState(() => currentIndex = value),
      ),
    );
  }

  List<BottomNavigationBarItem> items() => [
        BottomNavigationBarItem(
          icon: Icon((currentIndex == 1) ? IconlyBold.home : IconlyBroken.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon((currentIndex == 1)
              ? IconlyBold.category
              : IconlyBroken.category),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentIndex == 2) ? IconlyBold.search : IconlyBroken.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon:
              Icon((currentIndex == 3) ? IconlyBold.heart : IconlyBroken.heart),
          label: "WishList",
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentIndex == 4) ? IconlyBold.profile : IconlyBroken.profile),
          label: "Profile",
        ),
      ];
}
