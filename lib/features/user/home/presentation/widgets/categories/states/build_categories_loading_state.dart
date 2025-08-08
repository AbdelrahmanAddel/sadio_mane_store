import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';

class BuildCategoriesLoadingState extends StatelessWidget {
  const BuildCategoriesLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) => _buildCategoriesLoadingItem(),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
      ),
    );
  }

  Widget _buildCategoriesLoadingItem() {
    return SizedBox(
      height: 140.h,
      width: 100.w,
      child: Column(
        children: [
          LoadingShimmer(width: 100.w, height: 100.h, borderRadius: 10.r),
          verticalSpace(10),
          LoadingShimmer(
            width: double.infinity.w,
            height: 10.h,
            borderRadius: 10.r,
          ),

        ],
      ),
    );
  }
}
