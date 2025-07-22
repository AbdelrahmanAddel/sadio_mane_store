import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_bottom_sheet_content_sheet.dart';

class EditNotificationBottomSheetContent extends StatelessWidget {
  const EditNotificationBottomSheetContent({
    required this.notificationContentModel,
    required this.currentIndex,
    super.key,
  });
  final NotificationContentModel? notificationContentModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationBloc>(),
      child: NotificationBottomSheetContent(
        currentIndex: currentIndex,
        isEdit: true,
        notificationContentModel: notificationContentModel,
      ),
    );
  }
}
