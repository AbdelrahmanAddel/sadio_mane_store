import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_network_image.dart';
import 'package:sadio_mane_store/core/common/widget/share_and_add_to_favorite_widget.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

class HomeViewProductItem extends StatelessWidget {
  const HomeViewProductItem({required this.product, super.key});
  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RoutesString.productDetails,
        arguments: product,
      ),
      child: CustomContainerLinearAdmin(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(5),
              const ShareAndAddToFavoriteWidget(),
              verticalSpace(6),
              Expanded(child: _buildProductImage(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: CustomCachedNetworkImage(
              width: double.infinity,
              height: 150.h,
              imageUrl: product.images?[0] ?? '',
            ),
          ),
        ),
        verticalSpace(4),
        _buildProductTitles(context),
      ],
    );
  }

  Widget _buildProductTitles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title ?? '',
          style: context.theme.textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(2),
        Text(
          product.category?.name ?? '',
          style: context.theme.textTheme.titleMedium,
        ),
        verticalSpace(2),
        Text(
          '\$${product.price}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
