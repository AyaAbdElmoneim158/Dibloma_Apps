import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static late SharedPreferences pref;

  static Future<SharedPreferences> init() async =>
      pref = await SharedPreferences.getInstance();

  static read(String key) async => json.decode(pref.getString(key)!);

  static save(String key, value) async {
    pref.setString(key, json.encode(value));
  }

  static remove(String key) => pref.remove(key);
}
