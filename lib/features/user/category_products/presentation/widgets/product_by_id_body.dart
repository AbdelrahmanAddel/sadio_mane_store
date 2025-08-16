import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/build_custom_paint.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_bloc.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_event.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/widgets/product_view_body.dart';

class ProductByIdBody extends StatelessWidget {
  const ProductByIdBody({required this.id, super.key});
  final double id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BuildCustomPaint(),
        RefreshIndicator(
          onRefresh: () async {
            context.read<CategoryDetailsBloc>().add(
              GetProductsByCategoryIdEvent(categoryId: id),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const CustomScrollView(slivers: [ProductsBodyView()]),
          ),
        ),
      ],
    );
  }
}
