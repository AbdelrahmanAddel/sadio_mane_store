import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_state.dart';

class EditCategoryBlocBuilder extends StatelessWidget {
  const EditCategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoriesBloc, CategoriesState>(
          listenWhen: (previous, current) {
            switch (current) {
              case UpdateCategoryLoading():
                return true;

              case UpdateCategorySuccess():
                return true;

              case UpdateCategoryFailure():
                return true;
              default:
                return false;
            }
          },
          listener: (context, state) {
            switch (state) {
              case UpdateCategoryLoading():
                showDialog<Widget>(
                  context: context,
                  builder:
                      (context) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellowAccent,
                        ),
                      ),
                );

              case UpdateCategorySuccess():
                context.pop();
                customFlutterToast(
                  message: 'Update Success',
                  backgroundColor: Colors.green,
                );
              case UpdateCategoryFailure():
                context.pop();

                customFlutterToast(message: 'Failure To Success');
              default:
            }
          },
        ),
        BlocListener<UploadImageCubit, UploadImageState>(
          listenWhen: (context, state) {
            switch (state) {
              case UploadImageSuccessState():
              case UploadImageLoadingState():
              case UploadImageErrorState():
                return true;
              default:
                return false;
            }
          },
          listener: (context, state) {
            switch (state) {
              case UploadImageSuccessState():
                context.pop();

                customFlutterToast(
                  message: 'Upload Image Success',
                  backgroundColor: Colors.green,
                );

              case UploadImageLoadingState():
                showDialog<Widget>(
                  context: context,
                  builder:
                      (context) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellowAccent,
                        ),
                      ),
                );

              case UploadImageErrorState():
                context.pop();

                customFlutterToast(
                  message: 'Upload Image Failied',
                  backgroundColor: Colors.green,
                );
              default:
            }
          },
        ),
      ],
      child: const SizedBox.shrink(),
    );
  }
} 