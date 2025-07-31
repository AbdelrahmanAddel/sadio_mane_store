import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/functions/text_form_field_validator.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widget/add_categories/add_category_bloc_listener.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widget/add_categories/add_category_modeal_buttom_sheet_bloc_builder.dart';

class AddCategoryModalBottomSheetContent extends StatelessWidget {
  const AddCategoryModalBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesBloc = context.read<CategoriesBloc>();
    final uploadImageCubit = context.read<UploadImageCubit>();

    return Form(
      key: categoriesBloc.addCategoryFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text('Add Categories', style: TextStyle(fontSize: 30)),
          ),
          verticalSpace(20),
          const Text('Add a photo', style: TextStyle(fontSize: 20)),
          verticalSpace(20),
          const AddCategoryModalButtomSheetContentBlocBuilder(),

          verticalSpace(20),
          const Text(
            'Enter The Categoreis Name',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
          ),
          verticalSpace(20),
          CustomTextFormField(
            controller: categoriesBloc.addCategoryNameController,
            validator: textFormFieldValidator(TextFormFieldEnums.categories),
            hintText: 'Category Name',
          ),
          verticalSpace(20),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              return CustomAppButton(
                onTap: () {
                  if (categoriesBloc.addCategoryFormKey.currentState!
                          .validate() &&
                      uploadImageCubit.imageUrl != '') {
                    categoriesBloc.add(
                      AddCategoriesEvent(imageUrl: uploadImageCubit.imageUrl!),
                    );
                  }
                },
                width: double.infinity,
                child:
                    state is AddCategoriesLoadingState
                        ? const CircularProgressIndicator()
                        : const Text('Create A New Category'),
              );
            },
          ),
          const AddCategoryBlocListener(),
        ],
      ),
    );
  }
}
