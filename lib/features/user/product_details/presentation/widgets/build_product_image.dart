import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_network_image.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildProductImage extends StatefulWidget {
  const BuildProductImage({required this.images, super.key});
  final List<String> images;

  @override
  State<BuildProductImage> createState() => _BuildProductImageState();
}

class _BuildProductImageState extends State<BuildProductImage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProductDetailsImage(images: widget.images),
        verticalSpace(15),
        _buildAnimatedSmoothIndicator(),
      ],
    );
  }

  Widget _buildProductDetailsImage({required List<String> images}) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return CustomCachedNetworkImage(
          width: double.infinity,
          imageUrl: images[itemIndex],
        );
      },
      options: _buildCarouselOptions(),
    );
  }

  Widget _buildAnimatedSmoothIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: widget.images.length,
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
        currentIndex = index;
        setState(() {});
      },
      height: 270.h,
      viewportFraction: 1,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(seconds: 2),
      autoPlayCurve: Curves.bounceIn,
      enlargeCenterPage: true,
    );
  }
}
