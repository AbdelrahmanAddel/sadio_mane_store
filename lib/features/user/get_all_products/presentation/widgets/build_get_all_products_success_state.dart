import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/product_list_item.dart';

class BuildGetAllProductsSuccessState extends StatelessWidget {
  const BuildGetAllProductsSuccessState({
    required this.products,
    required this.hasMoreData,
    super.key,
  });

  final List<ProductDataModel> products;
  final bool hasMoreData;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return HomeViewProductItem(product: products[index]);
        },
      ),
    );
  }
}
