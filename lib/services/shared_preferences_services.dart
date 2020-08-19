import 'package:shared_preferences/shared_preferences.dart';

Future saveStringToSharedPreferences(String key, String value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, value);
}

Future saveboolToSharedPreferences(String key, bool value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(key, value);
}

Future removeFromSharedPreferences(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove(key);
}

Future<bool> getBoolFromSharedPreferences(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool(key);
}

Future<String> getStringFromSharedPreferences(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(key);
}
