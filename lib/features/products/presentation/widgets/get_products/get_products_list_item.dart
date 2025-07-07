import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/edit_products/edit_product_show_bottom_content.dart';

class GetProductListItem extends StatelessWidget {
  const GetProductListItem({
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
    super.key,
  });
  final String productImageUrl;
  final String productName;
  final String productPrice;
  //TODO I prefet To Create a model for this data instead of pass this arguments

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 100,
      width: 100,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () => updateProducts(context),
                ),
                const Icon(Icons.delete, color: Colors.red),
              ],
            ),
            Flexible(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                    width: 200.w,
                    height: 120.h,
                    imageUrl: productImageUrl,
                    fit: BoxFit.fill,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            verticalSpace(5),
            Text(productName, textAlign: TextAlign.left),
            verticalSpace(5),
            Text('$productPrice\$'),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> updateProducts(BuildContext context) {
  return customShowModalBottomSheet(
    buttonWidget: const EditProductBottomSheetContent(),
    context: context,
  );
}
