import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_state.dart';

class AddNotificationBlocListener extends StatelessWidget {
  const AddNotificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listenWhen: (previous, current) {
        switch (current) {
          case AddNotificationLoadingState():
          case AddNotificationSuccessState():
          case AddNotificationErrorState():
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
