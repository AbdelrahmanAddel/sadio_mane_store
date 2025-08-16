import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';
import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_bloc.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_state.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/widgets/product_item.dart';

class ProductsBodyView extends StatelessWidget {
  const ProductsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
      buildWhen: (previous, current) =>
          current is GetProductsByCategoryIdLoading ||
          current is GetProductsByCategoryIdSuccess ||
          current is GetProductsByCategoryIdError,

      builder: (context, state) {
        return switch (state) {
          GetProductsByCategoryIdLoading() =>
            _buildGetProductsByCategoryIdLoadingState(),
          GetProductsByCategoryIdSuccess() => _buildGetCategoryBySuccessState(
            products: state.products,
          ),
          GetProductsByCategoryIdError() => SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          ),
        };
      },
    );
  }

  Widget _buildGetCategoryBySuccessState({
    required List<ProductsData> products,
  }) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => ProductItem(product: products[index]),
      itemCount: products.length,
    );
  }

  Widget _buildGetProductsByCategoryIdLoadingState() {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => const LoadingShimmer(),
      itemCount: 10,
    );
  }
}
