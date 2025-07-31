import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/text_form_field_validator.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

import 'package:sadio_mane_store/features/authentication/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/presentation/cubit/sign_in_state.dart';

class SignInTextFormFields extends StatelessWidget {
  const SignInTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final signInCubit = context.read<SignInCubit>();

        return Form(
          key: signInCubit.formKey,

          child: Column(
            children: [
              CustomTextFormField(
                validator: textFormFieldValidator(TextFormFieldEnums.email),
                controller: signInCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,

                hintText: context.tr.your_email,
              ),
              verticalSpace(40),
              CustomTextFormField(
                validator: textFormFieldValidator(TextFormFieldEnums.password),

                controller: signInCubit.passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                hintText: context.tr.password,
                obscureText: signInCubit.isObsecure,
                suffixIcon: IconButton(
                  onPressed: signInCubit.changeVisiability,
                  icon: Icon(
                    signInCubit.isObsecure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: context.theme.appColors.textColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
