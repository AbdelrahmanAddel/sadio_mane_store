import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';

class HomeViewBannerItem extends StatelessWidget {
  const HomeViewBannerItem({required this.banners, required this.currentIndex, super.key});
  final List<BannerProductDataModel> banners;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        width: double.infinity,
        fit: BoxFit.fill,
        imageUrl: banners[currentIndex].images?[0] ?? '',
        placeholder: (context, url) => Center(
          child: LoadingShimmer(width: double.infinity, height: 150.h),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
