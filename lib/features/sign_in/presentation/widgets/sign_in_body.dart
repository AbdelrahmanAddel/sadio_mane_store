import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_icon.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/widgets/change_theme_and_language_row_widget.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/widgets/sign_in_text_form_fields.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          verticalSpace(15),
          const ChangeThemeAndLanguageRow(),
          verticalSpace(60),
          Text(
            context.tr.login,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: 23.sp,
            ),
          ),
          verticalSpace(10),
          Text(
            context.tr.welcome,
            style: context.theme.textTheme.displaySmall!.copyWith(
              height: 1.7.h,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(40),
          const SignInTextFormFields(),
          verticalSpace(60),
          CustomAppButton(
            width: double.infinity,
            height: 57,
            child: Text(
              context.tr.login,

              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 19.sp,
              ),
            ),
          ),
          verticalSpace(40),
          Text(
            context.tr.create_account,
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontSize: 15.sp,
              color: context.theme.appColors.bluePinkLight,
            ),
          ),
        ],
      ),
    );
  }
}
