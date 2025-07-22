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
    on<SendNotificationEvent>(_createNotification);
    on<GetNotificationEvent>(_getNotificationFromLocalStorage);
    // on<UpdateNotificationEvent>(_onNotificationEventStarted);
    // on<DeleteNotificationEvent>(_onNotificationEventStarted);
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
    } catch (e) {
      emit(AddNotificationErrorState(message: e.toString()));
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
      emit(
        GetNotificationSuccessState(
          notificationContentModels: notificationContentModels,
        ),
      );
    } catch (e) {
      emit(GetNotificationErrorState(message: e.toString()));
    }
  }
}
