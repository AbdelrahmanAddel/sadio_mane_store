import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/banner/home_view_banner_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildHomeViewSuccessState extends StatelessWidget {
  const BuildHomeViewSuccessState({required this.banners, super.key});
  final List<BannerProductDataModel> banners;

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return Column(
      children: [
        _buildHomeViewBanner(banners: banners, homeBloc: homeBloc),
        verticalSpace(15),
        _buildAnimatedSmoothIndicator(
          length: banners.length,
          activeIndex: homeBloc.activeIndex,
          context: context,
        ),
        verticalSpace(20),
      ],
    );
  }

  Widget _buildHomeViewBanner({
    required List<BannerProductDataModel> banners,
    required HomeBloc homeBloc,
  }) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return HomeViewBannerItem(banners: banners, currentIndex: itemIndex);
      },
      options: _buildCarouselOptions(homeBloc: homeBloc),
    );
  }

  Widget _buildAnimatedSmoothIndicator({
    required int length,
    required int activeIndex,
    required BuildContext context,
  }) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: length,
      effect: SlideEffect(
        dotWidth: 20.w,
        dotHeight: 4.h,
        activeDotColor: context.theme.appColors.bluePinkDark,
      ),
    );
  }

  CarouselOptions _buildCarouselOptions({required HomeBloc homeBloc}) {
    return CarouselOptions(
      onPageChanged: (index, reason) {
        homeBloc.setActiveIndex(index);
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
