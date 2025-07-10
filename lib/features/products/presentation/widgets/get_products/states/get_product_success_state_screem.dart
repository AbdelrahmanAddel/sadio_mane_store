import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_all_products_listview.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_products_list_item.dart';

class GetProductSuccessStateScreen extends StatelessWidget {
  const GetProductSuccessStateScreen({super.key, required this.productDetails});
  final List<ProductDataModel> productDetails;

  @override
  Widget build(BuildContext context) {
    return buildGridView(
      length: productDetails.length,
      itemBuilder: (context, index) {
        return GetProductListItem(
          productData: productDetails[index],
          currentIndex: index,
        );
      },
    );
  }
}
