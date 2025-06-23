import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer/spacer_helper.dart';

class SignUpTextFormFields extends StatelessWidget {
  const SignUpTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          textInputAction: TextInputAction.next,
          hintText: context.tr.full_name,
          keyboardType: TextInputType.name,
        ),
        verticalSpace(28),
        CustomTextFormField(
          textInputAction: TextInputAction.next,
          hintText: context.tr.your_email,
          keyboardType: TextInputType.emailAddress,
        ),

        verticalSpace(28),
        CustomTextFormField(
          textInputAction: TextInputAction.done,
          hintText: context.tr.password,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          suffixIcon: const Icon(Icons.visibility),
        ),
      ],
    );
  }
}
