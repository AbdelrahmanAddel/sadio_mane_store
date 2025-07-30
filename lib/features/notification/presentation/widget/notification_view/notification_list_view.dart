import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_event.dart';
import 'package:sadio_mane_store/features/notification/presentation/bloc/notification_state.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_continer_content.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (previous, current) {
        switch (current) {
          case GetNotificationLoadingState():
          case GetNotificationSuccessState():
          case GetNotificationErrorState():
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return switch (state) {
          GetNotificationLoadingState() => const Center(
            child: CircularProgressIndicator(),
          ),
          GetNotificationSuccessState() => GetNotificationSuccessStateWidget(
            notificationContentModels: state.notificationContentModels,
          ),
          GetNotificationErrorState() => Center(child: Text(state.message)),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

class GetNotificationSuccessStateWidget extends StatelessWidget {
  const GetNotificationSuccessStateWidget({
    required this.notificationContentModels,
    super.key,
  });
  final List<NotificationContentModel> notificationContentModels;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NotificationBloc>().add(GetNotificationEvent());
      },
      child: ListView.separated(
        reverse: true,
        shrinkWrap: true,
        itemCount: notificationContentModels.length,
        itemBuilder: (context, index) {
          return CustomContainerLinearAdmin(
            height: 200.h,
            width: double.infinity,
            child: NotificationContinerContent(
              currentIndex: index,
              notificationContentModel: notificationContentModels[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return verticalSpace(20);
        },
      ),
    );
  }
}
