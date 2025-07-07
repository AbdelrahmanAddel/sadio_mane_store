import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

import 'package:sadio_mane_store/features/categories/presentation/widget/categories/categories_bloc_builder.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/get_all_categories_row.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Column(
        children: [
          verticalSpace(20),
          const GetAllCategoriesAndAddCategoriesRow(),
          verticalSpace(25),
          const CategoriesBlocBuilder(),
        ],
      ),
    );
  }
}
