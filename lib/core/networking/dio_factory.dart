import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dioInstace;
  static Dio getDio() {
    const time = Duration(seconds: 30);
    if (_dioInstace == null) {
      _dioInstace = Dio();
      prettyLoget();
      _dioInstace!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;
      _saveUserToken();
      _dioInterceptors();
      return _dioInstace!;
    } else {
      return _dioInstace!;
    }
  }

  static void prettyLoget() {
    _dioInstace!.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
  }

  static void _saveUserToken() {
    _dioInstace?.options.headers.addAll({
      'Authorization':
          'Bearer ${SharedPrefHelper.getString(SharedPrefKey.accessToken)}',
    });
  }

  static void _dioInterceptors() {
    _dioInstace?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = SharedPrefHelper.getString(SharedPrefKey.accessToken);
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
}
