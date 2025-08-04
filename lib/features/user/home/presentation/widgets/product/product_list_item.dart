import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_network_image.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(5),
            _buildProductContainerRow(),
            verticalSpace(6),
            Expanded(child: _buildProductImage()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: CustomCachedNetworkImage(
              width: double.infinity,
              height: 150.h,
              imageUrl:
                  'https://modenamotorsgmbh.com/63931-thickbox_default/porsche-911-992-carrera-4-gts-cabrio.jpg',
            ),
          ),
        ),
        verticalSpace(2),
        const Text('Hello World 10'),
        verticalSpace(2),
        const Text('Electronics'),
        verticalSpace(2),
        const Text(r'price  $500'),
      ],
    );
  }

  Widget _buildProductContainerRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.share_rounded),
        Icon(Icons.favorite_border_rounded),
      ],
    );
  }
}
