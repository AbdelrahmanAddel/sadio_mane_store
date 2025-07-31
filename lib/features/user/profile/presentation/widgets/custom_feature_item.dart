import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class CustomFeatureItem extends StatelessWidget {
  const CustomFeatureItem({
    required this.prefixText,
    super.key,
    this.prefixIcon,
    this.suffixWidget,
    this.suffixText,
  });

  final IconData? prefixIcon;
  final String prefixText;
  final Widget? suffixWidget;
  final String? suffixText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(prefixIcon, size: 25.r),
        horizontalSpace(8),
        Text(
          prefixText,
          style: TextStyle(
            fontSize: 18.sp,
            color: context.theme.appColors.textColor,
          ),
        ),
        const Spacer(),
        if (suffixText != null)
          Text(
            suffixText!,
            style: TextStyle(
              fontSize: 14.sp,
              color: context.theme.appColors.textColor,
            ),
          ),
        horizontalSpace(8),
        suffixWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}
