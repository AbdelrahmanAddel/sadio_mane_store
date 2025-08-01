import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/features/admin/notification/data/data_source/notification_local_data_source.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dioInstance;
  static void Function()? onUnauthorized;

  static Dio getDio() {
    const time = Duration(seconds: 30);
    if (_dioInstance == null) {
      _dioInstance = Dio();
      prettyLogger();
      _dioInstance!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;
      _saveUserToken();
      _dioInterceptors();
      return _dioInstance!;
    } else {
      return _dioInstance!;
    }
  }

  static void prettyLogger() {
    _dioInstance!.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
  }

  static void _saveUserToken() {
    _dioInstance?.options.headers.addAll({
      'Authorization':
          'Bearer ${SharedPrefHelper.getString(SharedPrefKey.accessToken)}',
    });
  }

  static void _dioInterceptors() {
    _dioInstance?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = SharedPrefHelper.getString(SharedPrefKey.accessToken);
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: _handleUnauthorizedAndRefreshToken,
      ),
    );
  }

  static Future<void> _handleUnauthorizedAndRefreshToken(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 400) {
      await SharedPrefHelper.removeData(SharedPrefKey.accessToken);
      await SharedPrefHelper.removeData(SharedPrefKey.refreshToken);
      await NotificationLocalDataSource.notificationBox.clear();
      _dioInstance?.interceptors.clear();
      if (onUnauthorized != null) {
        onUnauthorized!.call();
      }
      return handler.next(error);
    }
  }
}
