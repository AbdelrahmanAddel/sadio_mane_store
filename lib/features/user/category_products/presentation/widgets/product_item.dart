import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_network_image.dart';
import 'package:sadio_mane_store/core/common/widget/share_and_add_to_favorite_widget.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, super.key});
  final ProductsData? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(
          routeName: RoutesString.productDetails,
          arguments: _mapToProductDataModel(product),
        );
      },
      child: CustomContainerLinearAdmin(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShareAndAddToFavoriteWidget(),
              verticalSpace(10),

              Expanded(
                child: CustomCachedNetworkImage(
                  width: double.infinity,
                  imageUrl: product?.images?[0] ?? '',
                ),
              ),
              verticalSpace(6),
              _buildProductStrings(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductStrings(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.title ?? 'There is no title',
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(5),
          Text(
            '\$ ${product?.price ?? "some thing wen't wrong "} ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  ProductDataModel _mapToProductDataModel(ProductsData? data) {
    return ProductDataModel(
      id: '',
      title: data?.title ?? '',
      price: data?.price ?? 0,
      description: data?.description ?? '',
      images: data?.images ?? [],
      category: ProductCategoryModel(),
    );
  }
}
