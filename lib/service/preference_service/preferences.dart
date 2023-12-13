import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{
  static Future<bool> setData(dynamic key, dynamic val) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final decoded = jsonEncode(val);
    return await sharedPreferences.setString(key, decoded);
  }

  static Future<dynamic> getData(dynamic key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final val = sharedPreferences.getString(key);
    return val ?? '';
  }
}