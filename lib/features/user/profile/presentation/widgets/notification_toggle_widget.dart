import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/notification/data/send_cloud_notification.dart';

class NotificationToggleWidget extends StatefulWidget {
  const NotificationToggleWidget({super.key});

  @override
  State<NotificationToggleWidget> createState() =>
      _NotificationToggleWidgetState();
}

class _NotificationToggleWidgetState extends State<NotificationToggleWidget> {
  late final NotificationsHelper _notificationHelper;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _notificationHelper = NotificationsHelper.getInstance;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SizedBox(
              height: 35.h,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: context.theme.appColors.mainColor,
              ),
            ),
          )
        : Transform.scale(
            scale: 0.9,
            child: Switch.adaptive(
              value: _notificationHelper.isSubscribedInNotification,
              onChanged: (value) async {
                await _handleNotificationToggle(value);
              },
            ),
          );
  }

  Future<void> _handleNotificationToggle(bool value) async {
    isLoading = true;
    setState(() {});
    await _notificationHelper.notificationSubscriptionControl();
    setState(() {
      isLoading = false;
    });
  }
}
