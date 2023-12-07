import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String themeStatus = "ThemeStatus";
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  ThemeProvider() {
    getTheme();
  }

  void setTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(themeStatus, value);
    _darkTheme = value;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _darkTheme = pref.getBool(themeStatus) ?? false;
    notifyListeners();
    return _darkTheme;
  }
}
