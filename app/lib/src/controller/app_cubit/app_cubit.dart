import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/src/views/category/category_screen.dart';
import 'package:todo_app/src/views/home/screens/home_screen.dart';
import 'package:todo_app/src/views/profile/profile_screen.dart';
import 'package:todo_app/src/views/search/search_product_screen.dart';
import 'package:todo_app/src/views/wish_views/wish_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : currentPage = defaultX,
        super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;
  static int get defaultX => 0;

  PageController controller = PageController(initialPage: defaultX);

  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    SearchProductScreen(),
    WishScreen(),
    ProfileScreen(),
    /* Center(
      child: Text("ProfileScreen",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )),
    ),*/
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

  void onSelected(int index) {
    currentPage = index;
    controller.jumpToPage(currentPage);
    emit(OnSelectedState());
  }

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnPageChangedState());
  }
}
