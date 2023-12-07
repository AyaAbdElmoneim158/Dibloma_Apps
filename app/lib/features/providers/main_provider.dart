import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/utils/app_strings.dart';
import '/features/views/category_views/category_screen.dart';
import '/features/views/home_views/screens/home_screen.dart';
import '/features/views/profile_views/screens/profile_screen.dart';
import '/features/views/search_views/search_screen.dart';
import '/features/views/wish_views/wish_screen.dart';

class MainProvider with ChangeNotifier {
  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    WishScreen(),
    ProfileScreen()
  ];
  List<BottomNavigationBarItem> items() => [
        BottomNavigationBarItem(
          icon: Icon((currentPage == 0) ? IconlyBold.home : IconlyBroken.home),
          label: AppStrings.homeLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentPage == 1) ? IconlyBold.category : IconlyBroken.category),
          label: AppStrings.categoriesLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentPage == 2) ? IconlyBold.search : IconlyBroken.search),
          label: AppStrings.searchLabel,
        ),
        BottomNavigationBarItem(
          icon:
              Icon((currentPage == 3) ? IconlyBold.heart : IconlyBroken.heart),
          label: AppStrings.wishListLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentPage == 4) ? IconlyBold.profile : IconlyBroken.profile),
          label: AppStrings.profileLabel,
        ),
      ];

  int currentPage;
  MainProvider() : currentPage = defaultX;
  static int get defaultX => 3;

  PageController controller = PageController(initialPage: defaultX);

  void onSelected(int index) {
    currentPage = index;
    notifyListeners();
    controller.jumpToPage(currentPage);
  }

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }
}
