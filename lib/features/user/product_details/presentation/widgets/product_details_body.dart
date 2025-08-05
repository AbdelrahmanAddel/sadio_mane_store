import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/product_details/presentation/widgets/build_product_image.dart';
import 'package:sadio_mane_store/features/user/product_details/presentation/widgets/product_details_custom_painter.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.product, super.key});
  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCustomPaint(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  _buildShareAndAddToFavWidget(),
                  verticalSpace(10),
                  BuildProductImage(images: product.images ?? []),
                  verticalSpace(20),
                  _buildProductStrings(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShareAndAddToFavWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border, size: 40),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: 40)),
      ],
    );
  }

  CustomPaint _buildCustomPaint(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: ProductDetailsCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.theme.appColors.bluePinkDark,
            context.theme.appColors.bluePinkLight,
          ],
        ),
      ),
    );
  }

  Widget _buildProductStrings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title ?? 'This Product Has No Title',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        verticalSpace(10),
        Text(
          maxLines: 300,
          product.description ?? 'This Product Has No Description',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
