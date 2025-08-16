import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class BuildChooseSearchType extends StatelessWidget {
  const BuildChooseSearchType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildChooseSearchTypeButton(
          buttonName: 'Search By Name',
          context: context,
        ),
        _buildChooseSearchTypeButton(
          buttonName: 'Search By Name',
          context: context,
        ),
      ],
    );
  }

  Widget _buildChooseSearchTypeButton({
    required String buttonName,
    required BuildContext context,
  }) {
    return Container(
      width: 150.w,
      height: 50,
      decoration: BoxDecoration(
        color: context.theme.appColors.containerLinear1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(buttonName, style: const TextStyle(fontSize: 17)),
      ),
    );
  }
}
