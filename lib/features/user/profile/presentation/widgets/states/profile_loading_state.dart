import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:shimmer/shimmer.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(120),
          _buildShimmerCircleAvatar(),
          verticalSpace(15),
          _buildShimmerText(width: 100),
          verticalSpace(15),
          _buildShimmerText(width: 150),
        ],
      ),
    );
  }

  Widget _buildShimmerCircleAvatar() {
    return Shimmer(
      gradient: LinearGradient(
        colors: [Colors.grey.shade600, Colors.grey.shade400],
      ),
      child: CircleAvatar(radius: 50.r),
    );
  }

  Widget _buildShimmerText({required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade400,
      child: Container(
        width: width,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
