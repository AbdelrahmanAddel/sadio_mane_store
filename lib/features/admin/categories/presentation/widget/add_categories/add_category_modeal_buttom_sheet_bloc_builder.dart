import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';

class AddCategoryModalButtomSheetContentBlocBuilder extends StatelessWidget {
  const AddCategoryModalButtomSheetContentBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadImageCubit = BlocProvider.of<UploadImageCubit>(context);

    return BlocBuilder<UploadImageCubit, UploadImageState>(
      buildWhen: (previous, current) {
        switch (current.runtimeType) {
          case const (UploadImageInitialState):
          case const (UploadImageSuccessState):
          case const (UploadImageLoadingState):
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return switch (state) {
          UploadImageInitialState() => initailStateScreen(uploadImageCubit),
          UploadImageSuccessState() => uploadImageSuccessScreen(
            uploadImageCubit,
          ),
          UploadImageLoadingState() => const Center(
            child: CircularProgressIndicator(),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget initailStateScreen(UploadImageCubit uploadImageCubit) {
    return GestureDetector(
      onTap: () async {
        await uploadImageCubit.pickImageAndUpload();
      },
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[400],
        ),
        child: const Icon(Icons.add_a_photo, size: 70),
      ),
    );
  }

  Widget uploadImageSuccessScreen(UploadImageCubit uploadImageCubit) {
    return GestureDetector(
      onTap: () async {
        await uploadImageCubit.pickImageAndUpload();
      },
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[400],
          image:
              uploadImageCubit.imageUrl != null
                  ? DecorationImage(
                    image: NetworkImage(uploadImageCubit.imageUrl!),
                    fit: BoxFit.cover,
                  )
                  : null,
        ),
        child: const Icon(Icons.edit, size: 70),
      ),
    );
  }
}
