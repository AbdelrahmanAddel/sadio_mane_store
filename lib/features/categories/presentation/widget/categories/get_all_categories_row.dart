import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/add_categories/add_category_modal_buttom_sheet_content.dart';

class GetAllCategoriesAndAddCategoriesRow extends StatelessWidget {
  const GetAllCategoriesAndAddCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Get All Categories',
          style: context.theme.textTheme.displaySmall?.copyWith(
            fontSize: 17.sp,
          ),
        ),
        CustomAppButton(
          onTap:
              () => customShowModalBottomSheet(
                context: context,
                buttonWidget: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => getIt<UploadImageCubit>()),
                    BlocProvider.value(value: context.read<CategoriesBloc>()),
                  ],
                  child: const AddCategoryModalBottomSheetContent(),
                ),
              ),
          width: 100.sp,
          child: Text(
            'Add',
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 17.sp,
            ),
          ),
        ),
      ],
    );
  }
}
