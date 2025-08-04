import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 50,
        itemBuilder: _buildCategoryItem,
        separatorBuilder: _separatorBuilder,
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: index == 0 ? 6.w : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              width: 100.h,
              height: 100.h,
              imageUrl:
                  'https://res.cloudinary.com/dhfns0ehj/image/upload/v1754292238/ijmn3rg87ndlmqyiblas.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        verticalSpace(10),
        Text('Category $index'),
      ],
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) =>
      SizedBox(width: 10.w);
}
