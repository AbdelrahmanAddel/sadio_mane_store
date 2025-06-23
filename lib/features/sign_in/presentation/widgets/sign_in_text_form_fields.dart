import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class SignInTextFormFields extends StatelessWidget {
  const SignInTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,

          hintText: context.tr.your_email,
        ),
        verticalSpace(40),
        CustomTextFormField(
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          hintText: context.tr.password,
          obscureText: true,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.visibility,
              color: context.theme.appColors.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
