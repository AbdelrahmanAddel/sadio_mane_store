import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class SignInButtonAndText extends StatelessWidget {
  const SignInButtonAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppButton(
          width: double.infinity,
          height: 57.h,
          child: Text(
            context.tr.login,

            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 19.sp,
            ),
          ),
        ),

        verticalSpace(40),
        GestureDetector(
          onTap: () => context.pushReplacement(routeName: RoutesString.signUp),
          child: Text(
            context.tr.create_account,
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 15.sp,
              color: context.theme.appColors.bluePinkLight,
            ),
          ),
        ),
      ],
    );
  }
}
