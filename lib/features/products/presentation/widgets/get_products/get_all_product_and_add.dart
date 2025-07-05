import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';

class ProductsActionRow extends StatelessWidget {
  const ProductsActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Get All Products ', style: TextStyle(fontSize: 20)),
        CustomAppButton(width: 100, height: 40, child: Text('Add')),
      ],
    );
  }
}
