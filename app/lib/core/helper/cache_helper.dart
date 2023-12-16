import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await _preferences.setString(key, value);
    } else if (value is int) {
      return await _preferences.setInt(key, value);
    } else if (value is double) {
      return await _preferences.setDouble(key, value);
    } else if (value is bool) {
      return await _preferences.setBool(key, value);
    }
    return false;
  }

  static dynamic loadData({required String key}) {
    return _preferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _preferences.remove(key);
  }
}
