import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class DashBoardContinerContent extends StatelessWidget {
  const DashBoardContinerContent({
    required this.title,
    required this.numbers,
    required this.imagePath,
    super.key,
  });
  final String title;
  final String numbers;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.theme.textTheme.displaySmall!.copyWith(
                    fontSize: 24.sp,
                    color: context.theme.appColors.textColor,
                  ),
                ),
                verticalSpace(20),
                Text(
                  numbers,
                  style: context.theme.textTheme.displaySmall!.copyWith(
                    fontSize: 24.sp,
                    color: context.theme.appColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(imagePath)),
        ],
      ),
    );
  }
}
