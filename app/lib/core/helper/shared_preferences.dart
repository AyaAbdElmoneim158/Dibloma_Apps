import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async =>
      prefs = await SharedPreferences.getInstance();

  static read(String key) async => json.decode(prefs.getString(key)!);

  static save(String key, value) async {
    prefs.setString(key, json.encode(value));
  }

  static remove(String key) => prefs.remove(key);
}
