import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({required this.title, super.key});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          CustomAppButton(
            width: 50.w,
            height: 50.h,
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back_ios, size: 25),
          ),
          horizontalSpace(70),
          Text(
            title == null || title == '' ? 'This Product Has No Title' : title!,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
