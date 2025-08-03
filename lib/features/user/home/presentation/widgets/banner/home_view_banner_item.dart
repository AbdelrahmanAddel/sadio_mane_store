import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';

class HomeViewBannerItem extends StatelessWidget {
  const HomeViewBannerItem({super.key});
  final String imageUrl =
      'https://i0.wp.com/thesefootballtimes.co/wp-content/uploads/2017/02/mane.jpg?fit=1600%2C1117&ssl=1';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        width: double.infinity,
        fit: BoxFit.fill,
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(
          child: LoadingShimmer(width: double.infinity, height: 150.h),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
