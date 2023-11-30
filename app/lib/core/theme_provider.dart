import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import '../core/helper/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool darkTheme = false;
  bool get getIsDarkTheme => darkTheme;
  ThemeProvider() {
    getDarkTheme();
  }

  void setDarkTheme(bool val) async {
    SharedPref.save(AppStrings.themeKey, val);
    darkTheme = val;
    notifyListeners();
  }

  Future<bool> getDarkTheme() async {
    darkTheme = bool.parse(SharedPref.read(AppStrings.themeKey));
    notifyListeners();
    return darkTheme;
  }
}
