import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_admin_app_bar.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/notification/presentation/widget/notification_view/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.mainColor,
      appBar: CustomAdminAppBar(
        backGrounfColor: context.theme.appColors.mainColor,
        title: 'Notification',
        isMain: true,
      ),
      body: const NotificationViewBody(),
    );
  }
}
