import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';

sealed class NotificationState {}

class NotificationInitial extends NotificationState {}

class AddNotificationLoadingState extends NotificationState {}

class AddNotificationSuccessState extends NotificationState {
  AddNotificationSuccessState({required this.message});
  final String message;
}

class AddNotificationErrorState extends NotificationState {
  AddNotificationErrorState({required this.message});
  final String message;
}

class GetNotificationLoadingState extends NotificationState {}

class GetNotificationSuccessState extends NotificationState {
  GetNotificationSuccessState({required this.notificationContentModels});
  final List<NotificationContentModel> notificationContentModels;
}

class GetNotificationErrorState extends NotificationState {
  GetNotificationErrorState({required this.message});
  final String message;
}

class UpdateNotificationLoadingState extends NotificationState {}

class UpdateNotificationSuccessState extends NotificationState {
  UpdateNotificationSuccessState({required this.message});
  final String message;
}

class UpdateNotificationErrorState extends NotificationState {
  UpdateNotificationErrorState({required this.message});
  final String message;
}

class DeleteNotificationLoadingState extends NotificationState {}

class DeleteNotificationSuccessState extends NotificationState {
  DeleteNotificationSuccessState({required this.message});
  final String message;
}

class DeleteNotificationErrorState extends NotificationState {
  DeleteNotificationErrorState({required this.message});
  final String message;
}
