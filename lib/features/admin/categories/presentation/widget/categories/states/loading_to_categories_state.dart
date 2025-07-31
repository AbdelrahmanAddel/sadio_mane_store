import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';

Widget loadingToGetCategoriesScreen() {
  return ListView.separated(
    itemCount: 10,
    itemBuilder: (context, index) {
      return LoadingShimmer(
        width: double.infinity,
        height: 130.h,
        borderRadius: 20,
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return verticalSpace(15);
    },
  );
}
