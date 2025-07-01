import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class GetAllCategoriesRow extends StatelessWidget {
  const GetAllCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Get All Categories',
          style: context.theme.textTheme.displaySmall?.copyWith(
            fontSize: 17.sp,
          ),
        ),
        CustomAppButton(
          width: 100.sp,
          child: Text(
            'Add',
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 17.sp,
            ),
          ),
        ),
      ],
    );
  }
}
