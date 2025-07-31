import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class IconTapNavBar extends StatelessWidget {
  const IconTapNavBar({
    required this.onTap,
    required this.icon,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        color: isSelected
            ? context.theme.appColors.navBarSelectedTab
            : Colors.grey,
        height: 25.h,
      ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
    );
  }
}
