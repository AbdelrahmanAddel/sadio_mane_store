import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';

class EditModalBottomImageBlocBuilder extends StatelessWidget {
  const EditModalBottomImageBlocBuilder({
    required this.uploadImageCubit,
    required this.categoriesDataModel,
    super.key,
  });

  final UploadImageCubit uploadImageCubit;
  final CategoriesDataModel categoriesDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
            image: DecorationImage(
              image: NetworkImage(
                uploadImageCubit.imageUrl == ''
                    ? categoriesDataModel.image!
                    : uploadImageCubit.imageUrl!,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.edit, size: 70),
            onPressed: uploadImageCubit.pickImageAndUpload,
          ),
        );
      },
    );
  }
}
