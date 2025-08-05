import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/strings_extension.dart';

AppBar buildAppBar(BuildContext context, String? title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leadingWidth: 60.w,

    leading: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CustomAppButton(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios, size: 25),
      ),
    ),
    title: Text(
      title == null || title == ''
          ? 'This Product Has No Title'
          : title.convertToShortString,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
    ),
  );
}
