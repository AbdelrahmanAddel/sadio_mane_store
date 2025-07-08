import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';

class BottomImagesList extends StatelessWidget {
  const BottomImagesList({required this.isEdit, super.key});
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    return BlocProvider.value(
      value: context.read<UploadImageCubit>(),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          final uploadImageCubit = context.read<UploadImageCubit>();

          return BlocBuilder<UploadImageCubit, UploadImageState>(
            buildWhen:
                (previous, current) =>
                    current is UploadImageInitialState ||
                    current is UploadImageListLoadingState ||
                    current is UploadImageSuccessState,
            builder: (context, state) {
              if (state is UploadImageInitialState) {
                return _uploadImageInitalScree(
                  uploadImageCubit,
                  index,
                  productBloc,
                );
              } else if (state is UploadImageSuccessState) {
                return _uploadImageSuccess(
                  uploadImageCubit,
                  index,
                  productBloc,
                );
              } else if (state is UploadImageListLoadingState) {
                return _uploadImageLoadingState(
                  uploadImageCubit,
                  index,
                  productBloc,
                  state.currentIndex,
                );
              } else {
                return Container();
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return verticalSpace(10);
        },
      ),
    );
  }

  Widget _uploadImageSuccess(
    UploadImageCubit uploadImageCubit,
    int index,
    ProductBloc productBloc,
  ) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[400],
        image: DecorationImage(
          image: NetworkImage(
            uploadImageCubit.images[index] == ''
                ? 'https://thumb.ac-illust.com/b1/b170870007dfa419295d949814474ab2_t.jpeg'
                : uploadImageCubit.images[index],
          ),
        ),
      ),
      child: IconButton(
        onPressed: () {
          uploadImageCubit.uploadImageList(currentIndex: index);
          productBloc.imagesList = uploadImageCubit.images;
        },
        icon: Icon(
          isEdit ? Icons.edit : Icons.add_a_photo,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _uploadImageLoadingState(
    UploadImageCubit uploadImageCubit,
    int index,
    ProductBloc productBloc,
    int currentIndex,
  ) {
    return currentIndex == index
        ? const Center(child: CircularProgressIndicator())
        : Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
            image: DecorationImage(
              image: NetworkImage(
                uploadImageCubit.images[index] == ''
                    ? 'https://thumb.ac-illust.com/b1/b170870007dfa419295d949814474ab2_t.jpeg'
                    : uploadImageCubit.images[index],
              ),
            ),
          ),
          child: IconButton(
            onPressed: () {
              uploadImageCubit.uploadImageList(currentIndex: index);
              productBloc.imagesList = uploadImageCubit.images;
            },
            icon: Icon(
              isEdit ? Icons.edit : Icons.add_a_photo,
              size: 50,
              color: Colors.white,
            ),
          ),
        );
  }

  Widget _uploadImageInitalScree(
    UploadImageCubit uploadImageCubit,
    int index,
    ProductBloc productBloc,
  ) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[400],
        image: DecorationImage(
          image: NetworkImage(
            uploadImageCubit.images[index] == ''
                ? 'https://thumb.ac-illust.com/b1/b170870007dfa419295d949814474ab2_t.jpeg'
                : uploadImageCubit.images[index],
          ),
        ),
      ),
      child: IconButton(
        onPressed: () {
          uploadImageCubit.uploadImageList(currentIndex: index);
          productBloc.imagesList = uploadImageCubit.images;
        },
        icon: Icon(
          isEdit ? Icons.edit : Icons.add_a_photo,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
