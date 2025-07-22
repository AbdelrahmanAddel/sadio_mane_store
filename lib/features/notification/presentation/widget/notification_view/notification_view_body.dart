import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_add/add_notification_header.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_list_view.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: verticalSpace(30)),
            const SliverToBoxAdapter(child: AddNotificationHeader()),
            SliverToBoxAdapter(child: verticalSpace(30)),
            const SliverToBoxAdapter(child:  NotificationListView()),
          ],
        ),
      ),
    );
  }
}
