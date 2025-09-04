import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.initialize(
      localNotificationInitSettings(),
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static InitializationSettings localNotificationInitSettings() {
    return const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
    );
  }

  static void onTap(NotificationResponse notificationResponse) {}

  static Future<void> showSimpleNotification() async {
    await flutterLocalNotificationsPlugin.show(
      1,
      'Simple Notification',
      'Simple Notification Body',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'simple_channel_id',
          'Simple Channel',
          channelDescription: 'This is a simple notification channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}
