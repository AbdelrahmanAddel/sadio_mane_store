import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';

class AddProductBotton extends StatelessWidget {
  const AddProductBotton({required this.categoryId, super.key});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    final uploadImageCubit = context.read<UploadImageCubit>();
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state is AddProductLoadingState
            ? const Center(child: CircularProgressIndicator())
            : CustomAppButton(
              onTap: () {
                if (!uploadImageCubit.images[0].contains('')) {
                  customFlutterToast(message: 'You Must At Least 1 Image !');
                } else if (productBloc.formKey.currentState!.validate()) {
                  productBloc.add(
                    AddProductEvent(
                      uploadImageCubit.images,
                      categoryId: int.parse(categoryId),
                    ),
                  );
                }
              },
              width: double.infinity,
              child: const Text('Add'),
            );
      },
    );
  }
}
