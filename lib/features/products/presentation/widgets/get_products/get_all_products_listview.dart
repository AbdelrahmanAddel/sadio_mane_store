import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_products_list_item.dart';

class GetAllProductsListView extends StatelessWidget {
  const GetAllProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return const GetProductListItem(
          productImageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/e/e2/Sadio_Man%C3%A9_-_Persepolis_F.C._v_Al_Nassr_FC%2C_19_September_2023.jpg',
          productName: 'Sadio',
          productPrice: '3000',
        );
      },
    );
  }
}
