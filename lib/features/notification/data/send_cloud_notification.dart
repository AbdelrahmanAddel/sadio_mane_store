import 'package:flutter/widgets.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/features/notification/data/model/push_notification_model.dart';
import 'package:sadio_mane_store/features/notification/data/notification_body.dart';

class NotificationsHelper {
  NotificationsHelper._();
  static final NotificationsHelper getInstance = NotificationsHelper._();
  EnvVariable envVariable = EnvVariable.getInstance;
  Future<String?> getAccessToken() async {
    final serviceAccountJson = await envVariable.getServiceAccountJson();

    final scopes = <String>[
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    try {
      final http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

      client.close();
      debugPrint(
        'Access Token: ${credentials.accessToken.data}',
      ); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      debugPrint('Error getting access token: $e');
      return null;
    }
  }

  // creat instance of fbm
  Future<void> sendNotifications({
    required PushNotificationModel pushNotificationModel,
  }) async {
    try {
      final serverKeyAuthorization = await getAccessToken();

      final urlEndPoint = envVariable.notificationBaseUrl;

      final dio = DioFactory.getDio();
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      await dio.post<dynamic>(
        urlEndPoint,
        data: getBody(pushNotificationModel: pushNotificationModel),
      );
    } catch (e) {
      debugPrint('Error sending notification: $e');
    }
  }
}
