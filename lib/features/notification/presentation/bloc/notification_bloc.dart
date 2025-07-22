import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/notification/data/data_source/notification_local_data_source.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_event.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    clearAllControllers();

    print(NotificationLocalDataSource.notificationBox.values.toList());
    print(NotificationLocalDataSource.notificationBox.keys.toList());
    on<SendNotificationEvent>(_createNotification);
    on<GetNotificationEvent>(_getNotificationFromLocalStorage);
    on<UpdateNotificationEvent>(_updateNotification);
    on<DeleteNotificationEvent>(_deleteNotification);
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<NotificationContentModel> notificationList = [];

  FutureOr<void> _createNotification(
    SendNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(AddNotificationLoadingState());
    try {
      await NotificationLocalDataSource.notificationBox.add(
        NotificationContentModel(
          title: titleController.text,
          body: bodyController.text,
          createdAt: DateTime.now().toString(),
          productId: int.parse(productIdController.text),
        ),
      );

      clearAllControllers();
      add(GetNotificationEvent());

      emit(
        AddNotificationSuccessState(message: 'Notification Added Successfully'),
      );
    } catch (error) {
      emit(AddNotificationErrorState(message: error.toString()));
    }
  }

  FutureOr<void> _getNotificationFromLocalStorage(
    GetNotificationEvent event,
    Emitter<NotificationState> emit,
  ) {
    emit(GetNotificationLoadingState());
    try {
      final notificationContentModels = NotificationLocalDataSource
          .notificationBox
          .values
          .toList();
      notificationList = notificationContentModels;
      emit(
        GetNotificationSuccessState(
          notificationContentModels: notificationContentModels,
        ),
      );
    } catch (e) {
      emit(GetNotificationErrorState(message: e.toString()));
    }
  }

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

  FutureOr<void> _updateNotification(
    UpdateNotificationEvent event,
    Emitter<NotificationState> emit,
  ) {
    emit(UpdateNotificationLoadingState());
    try {
      NotificationLocalDataSource.notificationBox.put(
        event.id,
        NotificationContentModel(
          title: titleController.text,
          body: bodyController.text,
          createdAt: DateTime.now().toString(),
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
  ) {
    emit(DeleteNotificationLoadingState());
    try {
      NotificationLocalDataSource.notificationBox.delete(event.id);
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
