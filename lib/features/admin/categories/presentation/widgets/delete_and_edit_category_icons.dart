import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widgets/delete_category_dialog.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widgets/edit_category_modal_buttom_sheet_content.dart';

class DeleteAndEditCategoryIcons extends StatelessWidget {
  const DeleteAndEditCategoryIcons({
    required this.currentCategoryData,
    super.key,
  });
  final CategoriesDataModel currentCategoryData;

  @override
  Widget build(BuildContext context) {
    final categoriesBloc = context.read<CategoriesBloc>();

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red, size: 25),
          onPressed: () async {
            await deleteCategoryDiaglog(
              context,
              int.parse(currentCategoryData.id.toString()),
              categoriesBloc,
            );
          },
        ),
        horizontalSpace(20),

        IconButton(
          icon: const Icon(Icons.edit, color: Colors.green, size: 25),
          onPressed:
              () => customShowModalBottomSheet(
                buttonWidget: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => getIt<UploadImageCubit>()),
                    BlocProvider.value(value: context.read<CategoriesBloc>()),
                  ],
                  child: EditModalBottomSheetContent(
                    categoriesDataModel: currentCategoryData,
                  ),
                ),
                context: context,
              ),
        ),
      ],
    );
  }
} 