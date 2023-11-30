// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/app_strings.dart';
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
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    WishScreen(),
    ProfileScreen()
  ];
  List<BottomNavigationBarItem> items() => [
        BottomNavigationBarItem(
          icon: Icon((currentIndex == 0) ? IconlyBold.home : IconlyBroken.home),
          label: AppStrings.homeLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon((currentIndex == 1)
              ? IconlyBold.category
              : IconlyBroken.category),
          label: AppStrings.categoriesLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentIndex == 2) ? IconlyBold.search : IconlyBroken.search),
          label: AppStrings.searchLabel,
        ),
        BottomNavigationBarItem(
          icon:
              Icon((currentIndex == 3) ? IconlyBold.heart : IconlyBroken.heart),
          label: AppStrings.wishListLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentIndex == 4) ? IconlyBold.profile : IconlyBroken.profile),
          label: AppStrings.profileLabel,
        ),
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Helper.buildBottomNavigationBar(
        items: items(),
        onTap: (value) => setState(
          () => currentIndex = value,
        ),
        currentIndex: currentIndex,
      ),
      body: screens[currentIndex],
    );
  }
}
