import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_create_drop_down.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/edit_products/edit_product_botton.dart';

class CreateEditDropDown extends StatefulWidget {
  const CreateEditDropDown({
    required this.currentCategoryId,
    required this.productId, super.key,
  });
  final String currentCategoryId;
  final String productId;

  @override
  // ignore: no_logic_in_create_state
  State<CreateEditDropDown> createState() => _CreateEditDropDownState(
    productId: productId,

    currentCategoryId: currentCategoryId,
  );
}

class _CreateEditDropDownState extends State<CreateEditDropDown> {
  _CreateEditDropDownState({
    required this.productId,
    required this.currentCategoryId,
  });

  String categoryName = '';
  final String currentCategoryId;
  final String productId;

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
              EditProductBotton(
                productId: productId,

                categoryId: categoryId ?? currentCategoryId,
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
