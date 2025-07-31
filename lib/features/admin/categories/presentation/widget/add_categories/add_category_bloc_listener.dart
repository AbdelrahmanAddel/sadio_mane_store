import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_state.dart';

class AddCategoryBlocListener extends StatelessWidget {
  const AddCategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// 🔁 UploadImageCubit
        BlocListener<UploadImageCubit, UploadImageState>(
          listenWhen:
              (previous, current) =>
                  current is UploadImageSuccessState ||
                  current is UploadImageErrorState,
          listener: (context, state) {
            switch (state) {
              case UploadImageSuccessState():
                customFlutterToast(
                  message: 'Image Uploaded Success',
                  backgroundColor: Colors.green,
                );

              case UploadImageErrorState():
                customFlutterToast(
                  message: state.message,
                  backgroundColor: Colors.red,
                );

              default:
                break;
            }
          },
        ),

        /// 🔁 CategoriesBloc
        BlocListener<CategoriesBloc, CategoriesState>(
          listenWhen:
              (previous, current) =>
                  current is AddCategoriesSuccessState ||
                  current is AddCategoriesFailureState,
          listener: (context, state) {
            switch (state) {
              case AddCategoriesSuccessState():
                customFlutterToast(
                  message: state.successMessage,
                  backgroundColor: Colors.green,
                );

              case AddCategoriesFailureState():
                customFlutterToast(
                  message: state.errorMessage,
                  backgroundColor: Colors.red,
                );

              default:
                break;
            }
          },
        ),
      ],
      child: const SizedBox.shrink(),
    );
  }
}
