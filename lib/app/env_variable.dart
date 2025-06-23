import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { prod, dev }

class EnvVariable {
  EnvVariable._();
  static final EnvVariable getInstance = EnvVariable._();

  String _currentEnvType = '';
  Future<void> loadEnv({required EnvType envType}) async {
    switch (envType) {
      case EnvType.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvType.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _currentEnvType = dotenv.get('ENVTYPE');
  }

  bool get isDev => _currentEnvType == 'Devolpment';
}
