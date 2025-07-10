import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_loading.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/get_products/get_all_products_listview.dart';

class GetProductLoadingStateScreen extends StatelessWidget {
  const GetProductLoadingStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildGridView(
      length: 20,
      itemBuilder: (context, index) => const LoadingShimmer(),
    );
  }
}
