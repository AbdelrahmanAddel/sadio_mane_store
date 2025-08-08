import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/updata_category_request_model.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widgets/edit_category_bloc_listener.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widgets/edit_category_bottom_image_bloc_builder.dart';

class EditModalBottomSheetContent extends StatelessWidget {
  const EditModalBottomSheetContent({
    required this.categoriesDataModel,

    super.key,
  });
  final CategoriesDataModel categoriesDataModel;

  @override
  Widget build(BuildContext context) {
    final uploadImageCubit = context.read<UploadImageCubit>();
    final categoryBloc = context.read<CategoriesBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text('Edit Categories', style: TextStyle(fontSize: 30)),
        ),
        verticalSpace(20),
        const Text('Edit a photo', style: TextStyle(fontSize: 20)),
        verticalSpace(20),
        EditModalBottomImageBlocBuilder(
          uploadImageCubit: uploadImageCubit,
          categoriesDataModel: categoriesDataModel,
        ),
        verticalSpace(20),

        const Text(
          'Edit The Category Name',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
        ),
        verticalSpace(20),
        CustomTextFormField(
          controller: categoryBloc.addCategoryNameController,

          hintText: categoriesDataModel.name,
        ),
        verticalSpace(20),

        CustomAppButton(
          onTap: () {
            categoryBloc.add(
              UpdateCategoryEvent(
                updateCategoryModel: UpdateCategoryRequestModel(
                  id: int.parse(categoriesDataModel.id.toString()),
                  image:
                      uploadImageCubit.imageUrl == ''
                          ? categoriesDataModel.image
                          : uploadImageCubit.imageUrl,
                  name: categoriesDataModel.name,
                ),
              ),
            );
          },
          width: double.infinity,
          child: const Text('Done'),
        ),
        const EditCategoryBlocBuilder(),
      ],
    );
  }
} 