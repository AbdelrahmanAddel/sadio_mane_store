import 'package:hive_flutter/hive_flutter.dart';
part 'notification_content_model.g.dart';

@HiveType(typeId: 0)
class NotificationContentModel extends HiveObject {
  NotificationContentModel({
    required this.title,
    required this.body,
    required this.createdAt,
    required this.productId,
  });

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? body;

  @HiveField(2)
  final String? createdAt;

  @HiveField(3)
  int? productId;
}
