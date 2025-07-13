class PushNotificationModel {
  PushNotificationModel({
    required this.fcmToken,
    required this.title,
    required this.body,
    this.userId,
    this.type,
  });

  final String fcmToken;
  final String title;
  final String body;
  final String? userId;
  final String? type;
}
