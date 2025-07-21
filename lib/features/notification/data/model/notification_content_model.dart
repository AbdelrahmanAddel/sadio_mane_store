class NotificationContentModel {
  NotificationContentModel({
    required this.title,
    required this.body,
    required this.createdAt,
    required this.productId,
  });

  final String title;
  final String body;
  final String createdAt;
  final int productId;
}
