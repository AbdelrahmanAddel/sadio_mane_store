import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_network_image.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';

class BuildCategorySuccessState extends StatelessWidget {
  const BuildCategorySuccessState({required this.categories, super.key});
  final List<CategoriesDataModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            _buildCategoryItem(context, index, categories[index]),
        separatorBuilder: _separatorBuilder,
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    int index,
    CategoriesDataModel category,
  ) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: index == 0 ? 6.w : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CustomCachedNetworkImage(imageUrl: category.image ?? ''),
          ),
        ),
        verticalSpace(10),
        Text('${category.name}'),
      ],
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) =>
      SizedBox(width: 10.w);
}
