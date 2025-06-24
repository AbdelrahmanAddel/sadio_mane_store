import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._(); // Prevent instantiation

  static const _secureStorage = FlutterSecureStorage();
  static late SharedPreferences _prefs;

  // ------------------- Initialization -------------------
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: SharedPreferences initialized');
  }

  // ------------------- SharedPreferences Methods -------------------
  static Future<void> setData(String key, dynamic value) async {
    debugPrint('SharedPrefHelper: setData → key: $key, value: $value');
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else {
      throw UnsupportedError('Type ${value.runtimeType} is not supported.');
    }
  }

  static String getString(String key, {String defaultValue = ''}) {
    debugPrint('SharedPrefHelper: getString → key: $key');
    return _prefs.getString(key) ?? defaultValue;
  }

  static int getInt(String key, {int defaultValue = 0}) {
    debugPrint('SharedPrefHelper: getInt → key: $key');
    return _prefs.getInt(key) ?? defaultValue;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    debugPrint('SharedPrefHelper: getBool → key: $key');
    return _prefs.getBool(key) ?? defaultValue;
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    debugPrint('SharedPrefHelper: getDouble → key: $key');
    return _prefs.getDouble(key) ?? defaultValue;
  }

  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: removeData → key: $key');
    await _prefs.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: clearAllData');
    await _prefs.clear();
  }

  // ------------------- FlutterSecureStorage Methods -------------------

  static Future<void> setSecuredString(String key, String value) async {
    debugPrint('SecureStorage: set → key: $key, value: $value');
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key, {String defaultValue = ''}) async {
    debugPrint('SecureStorage: get → key: $key');
    return await _secureStorage.read(key: key) ?? defaultValue;
  }

  static Future<void> clearAllSecuredData() async {
    debugPrint('SecureStorage: clearAll');
    await _secureStorage.deleteAll();
  }
}