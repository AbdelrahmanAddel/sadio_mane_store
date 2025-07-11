import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';

import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/edit_products/states/edit_product_success_state_screen.dart';

class EditProductBottomSheetContent extends StatelessWidget {
  const EditProductBottomSheetContent({
    required this.currentProductIndex,
    required this.productData,
    super.key,
  });
  final int currentProductIndex;
  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProductBloc, ProductState>(
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
              return switch (state) {
                GetProductsLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
                GetProductsSuccessState() => EditProductSuccessStateScreen(
                  productData:
                      state.product.data?.products[currentProductIndex],
                ),

                GetProductsErrorState() => const Center(
                  child: Icon(Icons.error),
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }
}
