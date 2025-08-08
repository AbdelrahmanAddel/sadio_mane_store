import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_bloc.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_event.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/widgets/product_by_id_body.dart';

class ProductByIdView extends StatelessWidget {
  const ProductByIdView({required this.categoryDetails, super.key});
  final ({String categoryName, double categoryId}) categoryDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productByIdAppBar(categoryName: categoryDetails.categoryName),

      body: BlocProvider(
        create: (context) => getIt<CategoryDetailsBloc>()
          ..add(
            GetProductsByCategoryIdEvent(
              categoryId: categoryDetails.categoryId,
            ),
          ),
        child: ProductByIdBody(id: categoryDetails.categoryId),
      ),
    );
  }




  AppBar productByIdAppBar({required String categoryName}) {
    return AppBar(title: Text(categoryName));
  }
}
