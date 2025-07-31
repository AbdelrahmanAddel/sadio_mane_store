import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/text_form_field_validator.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/presentation/cubit/sign_up_cubit.dart';

class TextFormFields extends StatelessWidget {
  const TextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Form(
      key: signUpCubit.formKey,
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomTextFormField(
                validator: textFormFieldValidator(TextFormFieldEnums.fullName),
                controller: signUpCubit.fullNameController,
                textInputAction: TextInputAction.next,
                hintText: context.tr.full_name,
                keyboardType: TextInputType.name,
              ),
              verticalSpace(28),
              CustomTextFormField(
                validator: textFormFieldValidator(TextFormFieldEnums.email),
                controller: signUpCubit.emailController,
                textInputAction: TextInputAction.next,
                hintText: context.tr.your_email,
                keyboardType: TextInputType.emailAddress,
              ),

              verticalSpace(28),
              CustomTextFormField(
                validator: textFormFieldValidator(TextFormFieldEnums.password),
                controller: signUpCubit.passwordController,
                textInputAction: TextInputAction.done,
                hintText: context.tr.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: signUpCubit.isObserve,
                suffixIcon: IconButton(
                  icon: Icon(
                    signUpCubit.isObserve
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: signUpCubit.changePasswordVisiability,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
