import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/change_theme_and_language_row_widget.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/core/theme/font_weight_helper.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/widgets/sign_up_button_and_text.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/widgets/sign_up_text_form_fields.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          verticalSpace(15),
          const ChangeThemeAndLanguageRow(),
          verticalSpace(40),
          Text(
            context.tr.sign_up,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: 23.sp,
            ),
          ),
          verticalSpace(12),
          Text(
            context.tr.sign_up_welcome,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeightHelper.regular,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
          verticalSpace(20),

          const SignUpTextFormFields(),
          verticalSpace(12),
          const SignUpButtonAndText(),
        ],
      ),
    );
  }
}
