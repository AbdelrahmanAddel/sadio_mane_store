import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_admin_app_bar.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.mainColor,
      appBar: CustomAdminAppBar(
        backGroundColor: context.theme.appColors.mainColor,
        title: 'DashBoard',
        isMain: true,
      ),
      body: const DashboardBody(),
    );
  }
}
