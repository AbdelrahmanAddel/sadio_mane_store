import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({required this.productPrice, super.key});
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        color: context.theme.appColors.containerShadow1,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: _buildAddToCartChild(context),
    );
  }

  Widget _buildAddToCartChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$productPrice',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          CustomAppButton(
            width: 140.w,
            height: 40.h,
            child: Text(
              context.tr.add_to_cart,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
