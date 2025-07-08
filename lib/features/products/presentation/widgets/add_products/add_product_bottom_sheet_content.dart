import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_create_drop_down.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';
import 'package:sadio_mane_store/features/products/presentation/common/bottom_images_list.dart';
import 'package:sadio_mane_store/features/products/presentation/common/build_label_text_form_filed.dart';

class AddProductBottomSheetContent extends StatelessWidget {
  const AddProductBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    return BlocProvider.value(
      value: context.read<CategoriesBloc>(),

      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('Add Product', style: TextStyle(fontSize: 30)),
            ),
            verticalSpace(20),
            const Text('Add a photo', style: TextStyle(fontSize: 20)),
            verticalSpace(20),
            const BottomImagesList(isEdit: true),
            verticalSpace(20),
            buildLabeledTextField(
              text: 'Title',
              controller: productBloc.titleController,
            ),
            verticalSpace(10),
            buildLabeledTextField(
              text: 'Price',
              controller: productBloc.priceController,
            ),
            verticalSpace(10),
            buildLabeledTextField(
              text: 'Description',
              maxline: 5,
              controller: productBloc.descriptionController,
            ),
            verticalSpace(20),
            const SelectCategoryAndAdd(),
          ],
        ),
      ),
    );
  }
}

class SelectCategoryAndAdd extends StatefulWidget {
  const SelectCategoryAndAdd({super.key});

  @override
  State<SelectCategoryAndAdd> createState() => _SelectCategoryAndAddState();
}

class _SelectCategoryAndAddState extends State<SelectCategoryAndAdd> {
  String categoryName = '';

  String? categoryId;

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen:
          (previous, current) =>
              current is GetCategoriesSuccessState ||
              current is AddProductLoadingState,
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
              if (state is AddProductLoadingState)
                const Center(child: CircularProgressIndicator())
              else
                CustomAppButton(
                  onTap: () {
                    productBloc.add(
                      AddProductEvent(
                        categoryId: int.parse(categoryId.toString()),
                      ),
                    );
                  },
                  width: double.infinity,
                  child: const Text('Add'),
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
