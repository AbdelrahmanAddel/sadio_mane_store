import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/admin/notification/data/data_source/notification_local_data_source.dart';
import 'package:sadio_mane_store/features/admin/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/admin/notification/data/model/push_notification_model.dart';
import 'package:sadio_mane_store/features/admin/notification/data/send_cloud_notification.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/bloc/notification_event.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    _initialize();
  }

  // Controllers
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final productIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Local list for optional use
  NotificationsHelper notificationsHelper = NotificationsHelper.getInstance;

  // Bloc setup
  void _initialize() {
    clearAllControllers();

    on<AddNotificationEvent>(_createNotification);
    on<GetNotificationEvent>(_getNotifications);
    on<UpdateNotificationEvent>(_updateNotification);
    on<DeleteNotificationEvent>(_deleteNotification);
    on<SendNotification>(_sendNotification);
  }

  // Clear all input fields
  void clearAllControllers() {
    titleController.clear();
    bodyController.clear();
    productIdController.clear();
  }

  @override
  Future<void> close() {
    titleController.dispose();
    bodyController.dispose();
    productIdController.dispose();
    return super.close();
  }

  // ------------------ Bloc Handlers ------------------

  Future<void> _sendNotification(
    SendNotification event,
    Emitter<NotificationState> emit,
  ) async {
    emit(SendNotificationLoadingState());
    try {
      await NotificationsHelper.getInstance.sendNotifications(
        pushNotificationModel: PushNotificationModel(
          title: event.notification.title ?? '',
          body: event.notification.body ?? '',
          topicName: 'news',
          userId: '1',
          type: 'notification',
          fcmToken: '1',
        ),
      );

      clearAllControllers();
      add(GetNotificationEvent());

      emit(
        SendNotificationSuccessState(
          successMessage: 'Notification Sent Successfully',
        ),
      );
    } catch (e) {
      emit(SendNotificationErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _createNotification(
    AddNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(AddNotificationLoadingState());
    try {
      await NotificationLocalDataSource.notificationBox.add(
        NotificationContentModel(
          title: titleController.text.trim(),
          body: bodyController.text.trim(),
          createdAt: DateTime.now().toIso8601String(),
          productId: int.parse(productIdController.text),
        ),
      );

      clearAllControllers();
      add(GetNotificationEvent());

      emit(
        AddNotificationSuccessState(message: 'Notification Added Successfully'),
      );
    } catch (e) {
      emit(AddNotificationErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _getNotifications(
    GetNotificationEvent event,
    Emitter<NotificationState> emit,
  ) {
    emit(GetNotificationLoadingState());
    try {
      final notifications = NotificationLocalDataSource.notificationBox.values
          .toList();

      emit(
        GetNotificationSuccessState(notificationContentModels: notifications),
      );
    } catch (e) {
      emit(GetNotificationErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _updateNotification(
    UpdateNotificationEvent event,
    Emitter<NotificationState> emit,
  ) {
    emit(UpdateNotificationLoadingState());
    try {
      NotificationLocalDataSource.notificationBox.putAt(
        event.id,
        NotificationContentModel(
          title: titleController.text.trim(),
          body: bodyController.text.trim(),
          createdAt: DateTime.now().toIso8601String(),
          productId: int.parse(productIdController.text),
        ),
      );

      emit(
        UpdateNotificationSuccessState(
          message: 'Notification Updated Successfully',
        ),
      );
    } catch (e) {
      emit(UpdateNotificationErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _deleteNotification(
    DeleteNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(DeleteNotificationLoadingState());
    try {
      await NotificationLocalDataSource.notificationBox.deleteAt(
        event.currentIndex,
      );
      add(GetNotificationEvent());

      emit(
        DeleteNotificationSuccessState(
          message: 'Notification Deleted Successfully',
        ),
      );
    } catch (e) {
      emit(DeleteNotificationErrorState(message: e.toString()));
    }
  }
}
