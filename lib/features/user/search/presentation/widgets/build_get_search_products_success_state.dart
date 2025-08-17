import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/product_list_item.dart';

class BuildGetSearchProductsSuccessState extends StatelessWidget {
  const BuildGetSearchProductsSuccessState({required this.products, super.key});
  final List<ProductDataModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ProductCart(product: products[index]);
      },
    );
  }
}
