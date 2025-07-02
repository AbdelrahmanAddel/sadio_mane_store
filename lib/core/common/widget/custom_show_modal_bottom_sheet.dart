import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

Future<dynamic> customShowModalBottomSheet({
  required Widget buttonWidget,
  required BuildContext context,
  Future<dynamic>? whenComplete,
}) {
  return showModalBottomSheet<Widget>(
    isScrollControlled: true,
    backgroundColor: context.theme.appColors.bluePinkDark,
    context: context,
    builder:
        (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: SizedBox(
            width: double.infinity,
            height: 450.h,
            child: buttonWidget,
          ),
        ),
  ).whenComplete(() => whenComplete);
}
