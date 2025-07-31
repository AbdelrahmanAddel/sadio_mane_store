class PushNotificationModel {
  PushNotificationModel({
    required this.title,
    required this.body,
    this.fcmToken,

    this.topicName,
    this.userId,
    this.type,
  });

  final String? fcmToken;
  final String title;
  final String body;
  final String? userId;
  final String? type;
  final String? topicName;
}
