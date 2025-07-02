import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_show_modal_bottom_sheet.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/create_categories/add_category_modal_buttom_sheet_content.dart';

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
                buttonWidget: const AddCategoryModalBottomSheetContent(),
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
