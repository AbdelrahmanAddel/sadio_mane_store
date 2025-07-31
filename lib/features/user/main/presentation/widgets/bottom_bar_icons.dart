import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/icon_tab_nav_bar.dart';

class BottomBarIcons extends StatelessWidget {
  const BottomBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appColors.navBarbg,
      height: 88.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTapNavBar(
              onTap: () {},
              icon: Assets.assetsImagesSvgHomeTabIcon,
              isSelected: true,
            ),
            IconTapNavBar(
              onTap: () {},
              icon: Assets.assetsImagesSvgCategoriesTapIcon,
              isSelected: true,
            ),
            IconTapNavBar(
              onTap: () {},
              icon: Assets.assetsImagesSvgFavouriteTabIcon,
              isSelected: true,
            ),
            IconTapNavBar(
              onTap: () {},
              icon: Assets.assetsImagesSvgProfileTabIcon,
              isSelected: true,
            ),
          ],
        ),
      ),
    );
  }
} 