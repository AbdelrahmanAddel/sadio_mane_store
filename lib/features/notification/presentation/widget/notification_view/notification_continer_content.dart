import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notifcation_container_text.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_continer_actions.dart';

class NotificationContinerContent extends StatelessWidget {
  const NotificationContinerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 12.w, top: 20.h),
      child: Column(
        children: [
          const NotificationContainerText(
            title: 'Title',
            content: 'This is Title',
          ),
          verticalSpace(10),
          const NotificationContainerText(title: 'Body', content: 'THekkiw'),
          verticalSpace(10),
          const NotificationContainerText(
            title: 'Created At',
            content: 'This is Title',
          ),
          verticalSpace(10),
          const NotificationContainerActions(),
        ],
      ),
    );
  }
}
