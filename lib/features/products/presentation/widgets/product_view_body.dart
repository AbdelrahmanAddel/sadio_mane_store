import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_all_product_and_add.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_all_products_listview.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(30)),
          const SliverToBoxAdapter(child: ProductsActionRow()),
          SliverToBoxAdapter(child: verticalSpace(20)),
          const SliverToBoxAdapter(child: GetAllProductsListView()),
        ],
      ),
    );
  }
}
