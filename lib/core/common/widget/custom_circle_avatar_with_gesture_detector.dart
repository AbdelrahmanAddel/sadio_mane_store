import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class CustomCircleAvatarWithGestureDetector extends StatelessWidget {
  const CustomCircleAvatarWithGestureDetector({
    required this.child,
    super.key,
    this.backgroundImage,
    this.onTap,
    this.radius,
  });
  final Widget child;
  final ImageProvider? backgroundImage;
  final void Function()? onTap;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: CircleAvatar(
        backgroundImage: backgroundImage,
        backgroundColor: context.theme.appColors.bluePinkDark,
        radius: radius ?? 40.r,
        child: child,
      ),
    );
  }
}
