import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_state.dart';

class NotificationBlocListener extends StatelessWidget {
  const NotificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listenWhen: (previous, current) {
        switch (current) {
          case AddNotificationLoadingState():
          case AddNotificationSuccessState():
          case AddNotificationErrorState():
          case UpdateNotificationLoadingState():
          case UpdateNotificationSuccessState():
          case UpdateNotificationErrorState():
          case DeleteNotificationLoadingState():
          case DeleteNotificationSuccessState():
          case DeleteNotificationErrorState():
          case SendNotificationLoadingState():
          case SendNotificationSuccessState():
          case SendNotificationErrorState():
            return true;
          default:
            return false;
        }
      },
      listener: (context, state) {
        if (state is AddNotificationSuccessState) {
          Navigator.pop(context);
          customFlutterToast(
            message: state.message,
            backgroundColor: Colors.green,
          );
        } else if (state is AddNotificationErrorState) {
          Navigator.pop(context);

          customFlutterToast(message: state.message);
        } else if (state is UpdateNotificationSuccessState) {
          Navigator.pop(context);
          customFlutterToast(
            message: state.message,
            backgroundColor: Colors.green,
          );
        } else if (state is UpdateNotificationErrorState) {
          Navigator.pop(context);

          customFlutterToast(message: state.message);
        } else if (state is DeleteNotificationSuccessState) {
          Navigator.pop(context);
          customFlutterToast(
            message: state.message,
            backgroundColor: Colors.green,
          );
        } else if (state is DeleteNotificationErrorState) {
          Navigator.pop(context);

          customFlutterToast(message: state.message);
        } else if (state is SendNotificationSuccessState) {
          Navigator.pop(context);
          customFlutterToast(
            message: state.successMessage,
            backgroundColor: Colors.green,
          );
        } else if (state is SendNotificationErrorState) {
          Navigator.pop(context);

          customFlutterToast(message: state.errorMessage);
        } else {
          showDialog<Widget>(
            context: context,
            builder: (builder) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
