import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widgets/delete_and_edit_category_icons.dart';

import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({required this.currentCategoryData, super.key});
  final CategoriesDataModel currentCategoryData;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: double.infinity,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentCategoryData.name ?? 'No Name',
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  verticalSpace(20),
                  DeleteAndEditCategoryIcons(
                    currentCategoryData: currentCategoryData,
                  ),
                ],
              ),
            ),
            categoryImageContainer(),
          ],
        ),
      ),
    );
  }

  Widget categoryImageContainer() {
    return SizedBox(
      width: 150.w,
      height: 150.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: CachedNetworkImage(
          imageUrl: currentCategoryData.image ?? '',
          fit: BoxFit.fill,
          placeholder:
              (context, url) => LoadingShimmer(width: 150.w, height: 150.h),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
} 