import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is SignUpErrorState ||
              current is SignUpLoadingState ||
              current is SignUpSuccessState,
      listener: (context, state) {
        if (state is SignUpErrorState) {
          customFlutterToast(message: state.error);
        } else if (state is SignUpSuccessState) {
          customFlutterToast(
            message: 'Account Created Successfully',
            backgroundColor: context.theme.appColors.mainColor,
          );
          context.pushReplacement(routeName: RoutesString.signIn);

          Navigator.pushReplacementNamed(context, RoutesString.signIn);
        } else if (state is SignUpLoadingState) {
          _signUpLoadingWidget(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _signUpLoadingWidget(BuildContext context) {
    // ignor: document_ignores
    // ignore: inference_failure_on_function_invocation
    showDialog(
      context: context,
      builder:
          (context) => Center(
            child: CircularProgressIndicator(
              color: context.theme.appColors.mainColor,
            ),
          ),
    );
  }
}
