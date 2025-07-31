import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/text_form_field_validator.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/common/bottom_images_list.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/common/build_label_text_form_filed.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/widgets/add_products/select_and_product.dart';

class AddProductBottomSheetContent extends StatelessWidget {
  const AddProductBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    return BlocProvider.value(
      value: context.read<CategoriesBloc>(),

      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: productBloc.formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('Add Product', style: TextStyle(fontSize: 30)),
              ),
              verticalSpace(20),
              const Text('Add a photo', style: TextStyle(fontSize: 20)),
              verticalSpace(20),
              const BottomImagesList(isEdit: false),
              verticalSpace(20),
              buildLabeledTextField(
                validator: textFormFieldValidator(TextFormFieldEnums.title),
                text: 'Title',
                controller: productBloc.titleController,
              ),
              verticalSpace(10),
              buildLabeledTextField(
                validator: textFormFieldValidator(TextFormFieldEnums.price),

                text: 'Price',
                controller: productBloc.priceController,
              ),
              verticalSpace(10),
              buildLabeledTextField(
                validator: textFormFieldValidator(
                  TextFormFieldEnums.description,
                ),

                text: 'Description',
                maxline: 5,
                controller: productBloc.descriptionController,
              ),
              verticalSpace(20),
              const SelectAndAddProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
