import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_continer_content.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
  shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomContainerLinearAdmin(
          height: 200.h,
          width: double.infinity,
          child: const NotificationContinerContent(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(20);
      },
    );
  }
}
