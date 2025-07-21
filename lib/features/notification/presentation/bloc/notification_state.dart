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
