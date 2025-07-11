import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';

class ProductBlocListener extends StatelessWidget {
  const ProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductBloc, ProductState>(
          listenWhen:
              (previous, current) =>
                  current is AddProductSuccessState ||
                  current is AddProductErrorState ||
                  current is DeleteProductLoadingState ||
                  current is DeleteProductSuccessState ||
                  current is DeleteProductFailureState,

          listener: (context, state) {
            switch (state) {
              case AddProductSuccessState():
                customFlutterToast(
                  message: 'Product added successfully: ${state.product}',
                  backgroundColor: Colors.green,
                );
              case DeleteProductLoadingState():
                showDialog<Widget>(
                  context: context,
                  builder: (builder) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
                context.pop();

              case AddProductErrorState():
                customFlutterToast(
                  message: "Some Thing Wen't Wrong",
                  backgroundColor: Colors.red,
                );
              case DeleteProductFailureState():
                customFlutterToast(
                  message: state.error,
                  backgroundColor: Colors.red,
                );
              case DeleteProductSuccessState():
                customFlutterToast(
                  message: 'Product added successfully: ${state.message}',
                  backgroundColor: Colors.green,
                );
              default:
                return;
            }
          },
        ),
        BlocListener<UploadImageCubit, UploadImageState>(
          listenWhen:
              (previous, current) =>
                  current is UploadImageListSuccessState ||
                  current is UploadImageListFailureState,
          listener: (context, state) {
            if (state is UploadImageListSuccessState) {
              customFlutterToast(
                message: 'Images uploaded successfully',
                backgroundColor: Colors.green,
              );
            } else if (state is UploadImageListFailureState) {
              customFlutterToast(
                message: state.message,
                backgroundColor: Colors.red,
              );
            }
          },
        ),
      ],
      child: const SizedBox.shrink(),
    );
  }
}
