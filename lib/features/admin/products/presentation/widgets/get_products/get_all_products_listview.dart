import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_state.dart';

import 'package:sadio_mane_store/features/admin/products/presentation/widgets/get_products/states/get_product_failure_state_screen.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/get_products/states/get_product_loading_state_screen.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/get_products/states/get_product_success_state_screem.dart';

class GetAllProductsListView extends StatelessWidget {
  const GetAllProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) {
        switch (current) {
          case GetProductsLoadingState():
          case GetProductsSuccessState():
          case GetProductsErrorState():
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        switch (state) {
          case GetProductsLoadingState():
            return const GetProductLoadingStateScreen();
          case GetProductsSuccessState():
            return GetProductSuccessStateScreen(
              productDetails: state.product.data?.products ?? [],
            );
          case GetProductsErrorState():
            return const GetProductFailureStateScreen();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

Widget buildGridView({
  required int length,
  required IndexedWidgetBuilder itemBuilder,
}) {
  return GridView.builder(
    reverse: true,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      mainAxisExtent: 250.h,
    ),

    itemBuilder: itemBuilder,
  );
}
