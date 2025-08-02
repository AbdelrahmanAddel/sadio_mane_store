import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/bottom_bar_icons.dart';

class MainScreenBottomBar extends StatelessWidget {
  const MainScreenBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const BottomBarIcons(),
          Positioned(
            left: -24.w,
            top: 13.h,
            child: Container(
              width: 110.w,
              height: 110.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(context.theme.appImage.bigNavBar),
                ),
              ),
            ),
          ),
          Positioned(
            left: 25.w,
            top: 37.h,
            child: SvgPicture.asset(
              Assets.assetsImagesSvgCarShop,
              fit: BoxFit.fill,
              color: Colors.white,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
