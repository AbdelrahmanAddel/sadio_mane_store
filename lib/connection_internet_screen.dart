import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/constants/fonts_string.dart';
import 'package:sadio_mane_store/core/helpers/localization_extension.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/core/theme/font_weight_helper.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';

class ConnectionInternetScreen extends StatelessWidget {
  const ConnectionInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppSettingsCubit>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(context.theme.appImage.primaryImage),
            Text(
              context.tr.hellow,
              style: TextStyle(
                fontFamily: FontsString.poppins,
                fontWeight: FontWeightHelper.regular,
                fontSize: 50,
                color: context.theme.appColors.primaryColor,
              ),
            ),
            Text(
              context.tr.hellow,
              style: TextStyle(
                fontFamily: FontsString.cairo,
                fontWeight: FontWeightHelper.medium,
                fontSize: 50,
                color: context.theme.appColors.primaryColor,
              ),
            ),
            MaterialButton(
              onPressed: () {
                cubit.changeAppLanguage(const Locale('en'));
              },
              child: const Icon(Icons.abc),
            ),
          ],
        ),
      ),
    );
  }
}
