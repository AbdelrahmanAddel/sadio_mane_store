import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._(); // Private constructor to prevent instantiation

  static const _secureStorage = FlutterSecureStorage();

  // ------------------- SharedPreferences Methods -------------------

  static Future<void> setData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: setData → key: $key, value: $value');

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      throw UnsupportedError('Type ${value.runtimeType} is not supported.');
    }
  }

  static Future<String> getString(
    String key, {
    String defaultValue = '',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getString → key: $key');
    return prefs.getString(key) ?? defaultValue;
  }

  static Future<int> getInt(String key, {int defaultValue = 0}) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getInt → key: $key');
    return prefs.getInt(key) ?? defaultValue;
  }

  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getBool → key: $key');
    return prefs.getBool(key) ?? defaultValue;
  }

  static Future<double> getDouble(
    String key, {
    double defaultValue = 0.0,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getDouble → key: $key');
    return prefs.getDouble(key) ?? defaultValue;
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: removeData → key: $key');
    await prefs.remove(key);
  }

  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: clearAllData');
    await prefs.clear();
  }

  // ------------------- FlutterSecureStorage Methods -------------------

  static Future<void> setSecuredString(String key, String value) async {
    debugPrint('SecureStorage: set → key: $key, value: $value');
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(
    String key, {
    String defaultValue = '',
  }) async {
    debugPrint('SecureStorage: get → key: $key');
    return await _secureStorage.read(key: key) ?? defaultValue;
  }

  static Future<void> clearAllSecuredData() async {
    debugPrint('SecureStorage: clearAll');
    await _secureStorage.deleteAll();
  }
}
