import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/add_products/add_product_bottom_sheet_content.dart';

class ProductsActionRow extends StatelessWidget {
  const ProductsActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Get All Products ', style: const TextStyle(fontSize: 20)),
        CustomAppButton(
          onTap: () => addProduct(context),
          width: 100,
          height: 40,
          child: const Text('Add'),
        ),
      ],
    );
  }
}

Future<dynamic> addProduct(BuildContext context) {
  return customShowModalBottomSheet(
    buttonWidget: const AddProductBottomSheetContent(),
    context: context,
  );
}
