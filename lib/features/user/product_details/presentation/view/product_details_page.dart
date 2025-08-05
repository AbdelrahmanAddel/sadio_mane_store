import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/product_details/presentation/widgets/product_details_add_to_cart.dart';
import 'package:sadio_mane_store/features/user/product_details/presentation/widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({required this.product, super.key});
  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddToCart(productPrice: product.price.toString()),
      body: ProductDetailsBody(product: product),
    );
  }
}
