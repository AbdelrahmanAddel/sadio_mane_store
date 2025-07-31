import 'package:sadio_mane_store/features/admin/notification/data/model/notification_content_model.dart';

sealed class NotificationEvent {}

class AddNotificationEvent extends NotificationEvent {}

class GetNotificationEvent extends NotificationEvent {}

class UpdateNotificationEvent extends NotificationEvent {
  UpdateNotificationEvent({required this.id});
  final int id;
}

class DeleteNotificationEvent extends NotificationEvent {
  DeleteNotificationEvent({required this.currentIndex});
  final int currentIndex;
}

class SendNotification extends NotificationEvent {
  SendNotification({required this.notification});

  final NotificationContentModel notification;
}
