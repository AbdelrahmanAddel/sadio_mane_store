import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dioInstace;
  static Dio getDio() {
    const time = Duration(seconds: 30);
    if (_dioInstace == null) {
      _dioInstace = Dio();
      prettyLoget();
      return _dioInstace!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;
    } else {
      return _dioInstace!;
    }
  }

  static void prettyLoget() {
    _dioInstace!.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
  }
}
