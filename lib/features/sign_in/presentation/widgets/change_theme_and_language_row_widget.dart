import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadio_mane_store/core/common/widget/custom_icon.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class ChangeThemeAndLanguageRow extends StatelessWidget {
  const ChangeThemeAndLanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppButton(
          child: SvgPicture.asset(Assets.assetsImagesSvgDarkMode),
        ),
        CustomAppButton(
          width: 100.w,
          child: Text(
            context.tr.language,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: 19.sp,
            ),
          ),
        ),
      ],
    );
  }
}
