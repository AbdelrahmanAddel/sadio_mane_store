import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_create_drop_down.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';
import 'package:sadio_mane_store/features/products/presentation/common/bottom_images_list.dart';
import 'package:sadio_mane_store/features/products/presentation/common/build_label_text_form_filed.dart';

class EditProductBottomSheetContent extends StatelessWidget {
  const EditProductBottomSheetContent({
    required this.currentProductIndex,
    super.key,
  });
  final int currentProductIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (previous, current) {
              switch (current) {
                case GetProductsLoadingState():
                case GetProductsSuccessState():
                case GetProductsErrorState():
                  return true;
                default:
                  return false;
              }
            },
            builder: (context, state) {
              return switch (state) {
                GetProductsLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),

                GetProductsSuccessState() => _buildSuccessStateScreen(
                  state.product.data?.products[currentProductIndex],
                  context,
                ),

                GetProductsErrorState() => const Center(
                  child: Icon(Icons.error),
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessStateScreen(
    ProductDataModel? productData,
    BuildContext context,
  ) {
    final productBloc = context.read<ProductBloc>();
    productBloc.titleController.text = productData?.title ?? '';
    productBloc.priceController.text = productData?.price?.toString() ?? '';
    productBloc.descriptionController.text = productData?.description ?? '';
    productBloc.imagesList = productData?.images ?? [];

    return Column(
      children: [
        const Center(
          child: Text('Edit Product', style: TextStyle(fontSize: 30)),
        ),
        verticalSpace(20),
        const Text('Edit a photo', style: TextStyle(fontSize: 20)),
        verticalSpace(20),
        const BottomImagesList(isEdit: true),
        verticalSpace(20),
        buildLabeledTextField(
          controller: productBloc.titleController,
          text: 'Title',
        ),
        verticalSpace(10),
        buildLabeledTextField(
          controller: productBloc.priceController,
          text: 'Price',
        ),
        verticalSpace(10),
        buildLabeledTextField(
          controller: productBloc.descriptionController,
          text: 'Description',
          maxline: 5,
        ),
        verticalSpace(20),
        CustomCreateDropDown(
          items: const [],
          hintText: 'Sadio',
          onChanged: (string) {},
          value: 'value',
        ),
        verticalSpace(20),

        const CustomAppButton(width: double.infinity, child: Text('Done')),
      ],
    );
  }
}
