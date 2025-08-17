import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/product_list_item.dart';

class BuildProductSuccessState extends StatelessWidget {
  const BuildProductSuccessState({required this.products, super.key});
  final List<ProductDataModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length > 10 ? 10 : products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) =>
          ProductCart(product: products[index]),
    );
  }
}
