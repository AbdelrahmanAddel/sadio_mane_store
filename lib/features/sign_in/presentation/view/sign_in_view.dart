import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/animation/animate_do.dart';
import 'package:sadio_mane_store/core/common/animation/auth_custom_painter.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: context.theme.appColors.mainColor,
        bottomNavigationBar: CustomPaint(
          painter: AuthCustomPainter(
            gradient: LinearGradient(
              colors: [
                context.theme.appColors.bluePinkDark,
                context.theme.appColors.bluePinkLight,
                context.theme.appColors.bluePinkLight,
                context.theme.appColors.bluePinkLight,
                context.theme.appColors.bluePinkLight,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          size: Size(double.infinity, 150.h),
        ),
        body: const SingleChildScrollView(
          child: CustomFadeInRight(
            duration: 1000,
            child: Column(children: [SafeArea(child: SignInBody())]),
          ),
        ),
      ),
    );
  }
}
