import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_create_drop_down.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/add_products/add_product_botton.dart';

class SelectAndAddProduct extends StatefulWidget {
  const SelectAndAddProduct({super.key});

  @override
  State<SelectAndAddProduct> createState() => _SelectAndAddProductState();
}

class _SelectAndAddProductState extends State<SelectAndAddProduct> {
  String categoryName = '';

  String? categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) => current is GetCategoriesSuccessState,

      builder: (context, state) {
        if (state is GetCategoriesSuccessState) {
          final allNames =
              state.categoriesData.data?.categories
                  ?.map((e) => e.name ?? '')
                  .where((name) => name.isNotEmpty)
                  .toSet()
                  .toList() ??
              [];

          return Column(
            children: [
              CustomCreateDropDown(
                hintText: 'Select Category',
                value: allNames.contains(categoryName) ? categoryName : null,
                items: allNames,
                onChanged: (value) {
                  setState(() {
                    categoryName = value ?? '';
                    categoryId =
                        state.categoriesData.data?.categories
                            ?.firstWhere(
                              (category) => category.name == categoryName,
                            )
                            .id;
                  });
                },
              ),

              verticalSpace(20),
              AddProductBotton(categoryId: categoryId ?? ''),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
