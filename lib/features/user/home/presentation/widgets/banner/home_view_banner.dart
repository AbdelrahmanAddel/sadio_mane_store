import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/banner/home_view_banner_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeViewBanner extends StatefulWidget {
  const HomeViewBanner({super.key});
  @override
  State<HomeViewBanner> createState() => _HomeViewBannerState();
}

class _HomeViewBannerState extends State<HomeViewBanner> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHomeViewBanner(),
        verticalSpace(15),
        _buildAnimatedSmoothIndicator(),
        verticalSpace(20),
      ],
    );
  }

  Widget _buildHomeViewBanner() {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return const HomeViewBannerItem();
      },
      options: _buildCarouselOptions(),
    );
  }

  Widget _buildAnimatedSmoothIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 3,
      effect: SlideEffect(
        dotWidth: 20.w,
        dotHeight: 4.h,
        activeDotColor: context.theme.appColors.bluePinkDark,
      ),
    );
  }

  CarouselOptions _buildCarouselOptions() {
    return CarouselOptions(
      onPageChanged: (index, reason) {
        setState(() {
          activeIndex = index;
        });
      },
      height: 150.h,
      viewportFraction: 1,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(seconds: 2),
      autoPlayCurve: Curves.bounceIn,
      enlargeCenterPage: true,
    );
  }
}
