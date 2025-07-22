sealed class NotificationEvent {}

class SendNotificationEvent extends NotificationEvent {}

class GetNotificationEvent extends NotificationEvent {}

class UpdateNotificationEvent extends NotificationEvent {
  UpdateNotificationEvent({required this.id});
  final int id;
}

class DeleteNotificationEvent extends NotificationEvent {
  DeleteNotificationEvent({required this.id});
  final int id;
}
