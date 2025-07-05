import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class GetProductListItem extends StatelessWidget {
  const GetProductListItem({
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
    super.key,
  });
  final String productImageUrl;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 200,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.edit, color: Colors.green),
                Icon(Icons.delete, color: Colors.red),
              ],
            ),
            Expanded(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: productImageUrl,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            verticalSpace(5),
            Text(productName, textAlign: TextAlign.left),
            verticalSpace(5),
            Text(productPrice),
          ],
        ),
      ),
    );
  }
}
