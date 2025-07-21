import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_mode_adapter.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_event.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationStateStarted()) {
    Hive.registerAdapter(NotificationContentModeAdapter());
    on<NotificationEventStarted>(onNotificationEventStarted);
  }
  List<NotificationContentModel> notificationList = [];

  void onNotificationEventStarted(
    NotificationEventStarted event,
    Emitter<NotificationState> emit,
  ) {
    emit(NotificationStateStarted());
  }
}

abstract class HiveStrings {
  static const String notificationBox = 'notification';
  static const String notificationListKey = 'notificationList';
}
