import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_loading.dart';

class LoadingDashBoardScreen extends StatelessWidget {
  const LoadingDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingShimmer(borderRadius: 30, width: double.infinity, height: 130.h),
        verticalSpace(20),
        LoadingShimmer(borderRadius: 30, width: double.infinity, height: 130.h),
        verticalSpace(20),
        LoadingShimmer(borderRadius: 30, width: double.infinity, height: 130.h),
      ],
    );
  }
}
