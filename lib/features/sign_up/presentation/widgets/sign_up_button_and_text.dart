import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class SignUpButtonAndText extends StatelessWidget {
  const SignUpButtonAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppButton(
          width: double.infinity,
          height: 57,
          child: Text(
            context.tr.sign_up,
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 19.sp,
            ),
          ),
        ),
        verticalSpace(20),

        GestureDetector(
          onTap: () => context.pushReplacement(routeName: RoutesString.signIn),
          child: Text(
            context.tr.you_have_account,
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
