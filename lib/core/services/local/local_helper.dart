import 'dart:convert';

import 'package:bookia/features/authentication/data/models/response/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences pref;
  static String userDataKey = "user_data";

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static setUserData(UserData userData) {
    //parse object to json(map)
    var userObjectJson = userData.toJson();
    //encode map to string
    var userObjectJsonString = jsonEncode(userObjectJson);
    //save to shared pref
    pref.setString(userDataKey, userObjectJsonString);
  }

  static getUserdate() async {
    //get string from shared pref
    var userObjectJsonString = pref.getString(userDataKey);
    //decode string to map
    if (userObjectJsonString == null) {
      return null;
    }
    var userObjectJson = jsonDecode(userObjectJsonString);
    //parse map to object
    var userData = UserData.fromJson(userObjectJson);
    return userData;
  }

  //string
  static Future<bool> setString(String key, String value) async {
    return pref.setString(key, value);
  }

  static String? getString(String key) {
    return pref.getString(key);
  }

  //int
  static int? getInt(String key) {
    return pref.getInt(key);
  }

  static Future<bool> setInt(String key, int value) async {
    return pref.setInt(key, value);
  }

  //bool
  static bool? getBool(String key) {
    return pref.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return pref.setBool(key, value);
  }

  //double
  static double? getDouble(String key) {
    return pref.getDouble(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    return pref.setDouble(key, value);
  }

  //clear
  static Future<bool> clear() async {
    return pref.clear();
  }

  //remove
  static Future<bool> remove(String key) async {
    return pref.remove(key);
  }
}
