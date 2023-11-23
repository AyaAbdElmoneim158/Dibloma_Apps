import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/styles.dart';

// ignore: constant_identifier_names
enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    highlightColor: AppColors.whiteColor,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
      color: AppColors.whiteColor,
      titleTextStyle: Styles.getTitleAppStyle,
      centerTitle: true,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    highlightColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.fontColor,
      titleTextStyle: Styles.getTitleAppStyle,
      centerTitle: true,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.fontColor,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
