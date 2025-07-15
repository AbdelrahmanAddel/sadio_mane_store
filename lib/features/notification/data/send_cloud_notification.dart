import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart' as AppSettings;
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/features/notification/data/model/push_notification_model.dart';
import 'package:sadio_mane_store/features/notification/data/notification_body.dart';

class NotificationsHelper {
  NotificationsHelper._();
  static final NotificationsHelper getInstance = NotificationsHelper._();
  EnvVariable envVariable = EnvVariable.getInstance;
  bool isNotificationPermisionEnabled = false;
  bool isSubscribedInNotification = false;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initFirebaseMessaging() async {
    try {
      await FirebaseMessaging.instance.requestPermission();

      if (isIOSSimulator) {
        debugPrint('⚠️ iOS Simulator detected. Skipping FCM token operations.');
        return;
      }
      if (Platform.isIOS && !kIsWeb) {
        // Wait for APNS token to be available
        final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken == null) {
          debugPrint('⚠️ APNS token not available yet. Skipping getToken().');
          return;
        }
        debugPrint('✅ APNS Token available: ${apnsToken.substring(0, 20)}...');
      }

      final token = await FirebaseMessaging.instance.getToken();

      debugPrint('✅ FCM Token: $token');
      await _checkNotificationPermission();
    } catch (e) {
      debugPrint('🔥 initFirebaseMessaging error: $e');
    }
  }

  Future<void> _checkNotificationPermission() async {
    final responce = await messaging.getNotificationSettings();
    if (responce.authorizationStatus == AuthorizationStatus.authorized) {
      isNotificationPermisionEnabled = true;
      debugPrint('✅ Permission is granted');

      return;
    } else {
      isSubscribedInNotification = false;
      isNotificationPermisionEnabled = false;
      debugPrint('❌ Permission is not granted');
    }
  }

  Future<void> notificationSubscribtionControll() async {
    await _checkNotificationPermission();
    if (!isNotificationPermisionEnabled) {
      await requestNotificationPermission();
      return;
    } else {
      if (isSubscribedInNotification) {
        await unSubscrible();
      } else {
        await subscribe();
      }
    }
  }

  Future<void> requestNotificationPermission() async {
    final settings = await messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await subscribe();
      isNotificationPermisionEnabled = true;
      return;
    } else {
      if (Platform.isAndroid) {
        await AppSettings.openAppSettings();
      } else if (Platform.isIOS) {
        await AppSettings.openAppSettings();
      }
    }
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = await envVariable.getServiceAccountJson();

    final scopes = <String>[
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    try {
      final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        http.Client(),
      );

      debugPrint('Access Token: ${credentials.accessToken.data}');
      return credentials.accessToken.data;
    } catch (e) {
      debugPrint('Error getting access token: $e');
      return null;
    }
  }

  Future<void> subscribe() async {
    try {
      await FirebaseMessaging.instance.subscribeToTopic('news');
      isSubscribedInNotification = true;
      debugPrint('=========== Subscribed ✅ ============');
    } on Exception catch (error) {
      debugPrint('error = >>>>>> $error');
    }
  }

  Future<void> unSubscrible() async {
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic('news');
      isSubscribedInNotification = false;
      debugPrint('=========== Unsubscribed ❌ ============');
    } on Exception catch (error) {
      debugPrint('error = >>>>>> $error');
    }
  }

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
      debugPrint('Access Token  =>> $serverKeyAuthorization');
    } catch (e) {
      debugPrint('Error sending notification: =>>>>> $e');
    }
  }

  bool get isIOSSimulator {
    if (!Platform.isIOS || kIsWeb) return false;

    // Check environment variables that indicate simulator
    final env = Platform.environment;
    return env.containsKey('SIMULATOR_DEVICE_NAME') ||
        env.containsKey('SIMULATOR_UDID') ||
        env['SIMULATOR_DEVICE_NAME'] != null;
  }
}
