import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dioInstace;
  static Dio getDio() {
    const time = Duration(seconds: 30);
    if (dioInstace == null) {
      dioInstace = Dio();
      prettyLoget();
      return dioInstace!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;
    } else {
      return dioInstace!;
    }
  }

  static void prettyLoget() {
    dioInstace!.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
  }
}
