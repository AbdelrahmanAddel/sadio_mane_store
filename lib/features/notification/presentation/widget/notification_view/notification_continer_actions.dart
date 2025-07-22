import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_bottom_sheet_content_sheet.dart';

class NotificationContainerActions extends StatelessWidget {
  const NotificationContainerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.delete, color: Colors.red),
        horizontalSpace(25),
        IconButton(
          onPressed: () => editNotificationShowBottomSheet(context),
          icon: const Icon(Icons.edit, color: Colors.yellow),
        ),
        horizontalSpace(25),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send, color: Colors.green),
        ),
      ],
    );
  }

  Future<dynamic> editNotificationShowBottomSheet(BuildContext context) {
    return customShowModalBottomSheet(
      buttonWidget: const EditNotificationBottomSheetContent(),
      context: context,
    );
  }
}

class EditNotificationBottomSheetContent extends StatelessWidget {
  const EditNotificationBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationBloc>(),
      child: const NotificationBottomSheetContent(isEdit: true),
    );
  }
}
