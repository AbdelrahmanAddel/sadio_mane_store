import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { prod, dev }

class EnvVariable {
  EnvVariable._();
  static final EnvVariable getInstance = EnvVariable._();

  String _currentEnvType = '';
  String _notificationBaseUrl = '';
  String _accessTokenServiceAccountPath = '';

  Future<void> loadEnv({required EnvType envType}) async {
    switch (envType) {
      case EnvType.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvType.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _currentEnvType = dotenv.get('ENVTYPE');
    _notificationBaseUrl = dotenv.get('NOTIFICATION_BASE_URL');
    _accessTokenServiceAccountPath = dotenv.get(
      'ACCESS_TOKEN_SERVICE_ACCOUNT_JSON_PATH',
    );
  }

  bool get isDev => _currentEnvType == 'Devolpment';
  String get notificationBaseUrl => _notificationBaseUrl;
  String get accessTokenServiceAccoutJson => _accessTokenServiceAccountPath;
  Future<Map<String, dynamic>> getServiceAccountJson() async {
    final jsonString = await rootBundle.loadString(
      _accessTokenServiceAccountPath,
    );
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}
