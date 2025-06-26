import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_state.dart';

class SignInBlocListener extends StatelessWidget {
  const SignInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) {
        return current is SignInLoading ||
            current is SignInSuccess ||
            current is SignInFailure;
      },
      listener: (context, state) {
        if (state is SignInSuccess) {
          if (state.useRole == 'admin') {
            context
              ..pop()
              ..pushName(routeName: RoutesString.homeScreen);
          } else {
            context
              ..pop()
              ..pushName(routeName: RoutesString.signUp);
          }
        } else if (state is SignInFailure) {
          context.pop();
          customFlutterToast(
            errorMessage: state.error ?? '',
            backgroundColor: context.theme.appColors.bluePinkDark,
          );
        } else {
          _signInLoadingWidget(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _signInLoadingWidget(BuildContext context) {
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
