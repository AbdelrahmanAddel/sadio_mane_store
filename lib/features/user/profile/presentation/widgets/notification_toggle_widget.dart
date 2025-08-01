import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/admin/notification/data/send_cloud_notification.dart';

class NotificationToggleWidget extends StatefulWidget {
  const NotificationToggleWidget({super.key});

  @override
  State<NotificationToggleWidget> createState() =>
      _NotificationToggleWidgetState();
}

class _NotificationToggleWidgetState extends State<NotificationToggleWidget> {
  late final NotificationsHelper _notificationHelper;

  @override
  void initState() {
    super.initState();
    _notificationHelper = NotificationsHelper.getInstance;
  }

  @override
  Widget build(BuildContext context) {
 
    return Transform.scale(
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
    await _notificationHelper.notificationSubscriptionControl();
    setState(() {});
  }
}
