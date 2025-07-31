import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/get_products/get_all_product_and_add.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/get_products/get_all_products_listview.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().add(GetProductEvent());
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: verticalSpace(30)),
            const SliverToBoxAdapter(child: ProductsActionRow()),
            SliverToBoxAdapter(child: verticalSpace(20)),
            const SliverToBoxAdapter(child: GetAllProductsListView()),
          ],
        ),
      ),
    );
  }
}
