import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_container_content.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          verticalSpace(20),

          CustomContainerLinearAdmin(
            height: 130.h,
            width: double.infinity,
            child: const DashBoardContinerContent(
              title: 'Products',
              numbers: '10',
              imagePath: Assets.assetsImagesPngIosAndriod11SplashScreen,
            ),
          ),
          verticalSpace(20),

          CustomContainerLinearAdmin(
            height: 130.h,
            width: double.infinity,
            child: const DashBoardContinerContent(
              title: 'Categorys',
              numbers: '10',
              imagePath: Assets.assetsImagesPngIosAndriod11SplashScreen,
            ),
          ),
          verticalSpace(20),
          CustomContainerLinearAdmin(
            height: 130.h,
            width: double.infinity,
            child: const DashBoardContinerContent(
              title: 'Users',
              numbers: '10',
              imagePath: Assets.assetsImagesPngIosAndriod11SplashScreen,
            ),
          ),
        ],
      ),
    );
  }
}
