import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notifcation_container_text.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_continer_actions.dart';

class NotificationContinerContent extends StatelessWidget {
  const NotificationContinerContent({
    required this.notificationContentModel,
    required this.currentIndex,
    super.key,
  });

  final NotificationContentModel notificationContentModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 12.w, top: 20.h),
      child: Column(
        children: [
          NotificationContainerText(
            title: 'Title',
            content: notificationContentModel.title ?? '',
          ),
          verticalSpace(10),
          NotificationContainerText(
            title: 'Body',
            content: notificationContentModel.body ?? '',
          ),
          verticalSpace(10),
          NotificationContainerText(
            title: 'Created At',
            content: notificationContentModel.createdAt ?? '',
          ),
          verticalSpace(10),
          NotificationContainerActions(
            currentIndex: currentIndex,
            notificationContentModel: notificationContentModel,
          ),
        ],
      ),
    );
  }
}
