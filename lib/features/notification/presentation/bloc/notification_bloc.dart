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
    on<SendNotificationEvent>(_onNotificationEventStarted);
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FutureOr<void> _onNotificationEventStarted(
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
}
