import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/edit/egit_category_modal_buttom_sheet_content.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_loading.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    required this.categoryName,
    required this.categoryImage,
    super.key,
  });
  final String categoryName;
  final String categoryImage;

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
                    categoryName,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Icon(Icons.delete, color: Colors.red, size: 25),
                      horizontalSpace(20),

                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 25,
                        ),
                        onPressed:
                            () => customShowModalBottomSheet(
                              buttonWidget: const EditModalBottomSheetContent(),
                              context: context,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150.w,
              height: 150.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: categoryImage,
                  fit: BoxFit.fill,
                  placeholder:
                      (context, url) =>
                          LoadingShimmer(width: 150.w, height: 150.h),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
