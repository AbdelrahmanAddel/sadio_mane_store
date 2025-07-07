import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    required this.child,
    super.key,
    this.width,
    this.height,
    this.onTap,
  });
  final Widget? child;
  final double? width;
  final double? height;
  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 44.w,
        height: height ?? 44.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              context.theme.appColors.bluePinkLight,
              context.theme.appColors.bluePinkDark,
            ],
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
