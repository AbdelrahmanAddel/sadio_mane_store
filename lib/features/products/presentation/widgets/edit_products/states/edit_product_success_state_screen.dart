import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/text_form_field_validator.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/common/bottom_images_list.dart';
import 'package:sadio_mane_store/features/products/presentation/common/build_label_text_form_filed.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/edit_products/build_edit_drop_down_screen.dart';

class EditProductSuccessStateScreen extends StatelessWidget {
  const EditProductSuccessStateScreen({super.key, this.productData});
  final ProductDataModel? productData;

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    productBloc.titleController.text = productData?.title ?? '';
    productBloc.priceController.text = productData?.price?.toString() ?? '';
    productBloc.descriptionController.text = productData?.description ?? '';
    productBloc.imagesList = productData?.images ?? [];
    return Column(
      children: [
        Form(
          key: productBloc.formKey,
          child: Column(
            children: [
              const Center(
                child: Text('Edit Product', style: TextStyle(fontSize: 30)),
              ),
              verticalSpace(20),
              const Text('Edit a photo', style: TextStyle(fontSize: 20)),
              verticalSpace(20),
              BottomImagesList(isEdit: true, productDataModel: productData),
              verticalSpace(20),
              buildLabeledTextField(
                validator: textFormFieldValidator(TextFormFieldEnums.title),
                controller: productBloc.titleController,
                text: 'Title',
              ),
              verticalSpace(10),
              buildLabeledTextField(
                validator: textFormFieldValidator(TextFormFieldEnums.price),
                controller: productBloc.priceController,
                text: 'Price',
              ),
              verticalSpace(10),
              buildLabeledTextField(
                validator: textFormFieldValidator(
                  TextFormFieldEnums.description,
                ),
                controller: productBloc.descriptionController,
                text: 'Description',
                maxline: 5,
              ),
              verticalSpace(20),

              CreateEditDropDown(
                currentCategoryId: productData!.category!.id!,
                productId: productData!.id!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
