import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_loading.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';

import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_products_list_item.dart';

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
            return _getProductLoadingScreen();
          case GetProductsSuccessState():
            return _getProductSuccessScreen(state.product.data?.products ?? []);
          case GetProductsErrorState():
            return _getProductErrorScreen();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _getProductLoadingScreen() {
    return _buildGridView(
      length: 20,
      itemBuilder: (context, index) => const LoadingShimmer(),
    );
  }

  Widget _getProductErrorScreen() {
    return const Center(child: Text('Error'));
  }

  Widget _getProductSuccessScreen(List<ProductDataModel> productDetails) {
    return _buildGridView(
      length: productDetails.length,
      itemBuilder: (context, index) {
        return GetProductListItem(
          productImageUrl: productDetails[index].images?[0] ?? '',
          productName: productDetails[index].title ?? 'No Name',
          productPrice: productDetails[index].price?.toString() ?? '0',
          productId: productDetails[index].id ?? '0',
          currentIndex: index,
        );
      },
    );
  }
}

Widget _buildGridView({
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
