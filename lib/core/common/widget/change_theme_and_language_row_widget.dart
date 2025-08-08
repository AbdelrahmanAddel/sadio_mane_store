import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';

class ChangeThemeAndLanguageRow extends StatelessWidget {
  const ChangeThemeAndLanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppButton(
          onTap: () => context.read<AppSettingsCubit>().changeAppTheme(),

          child:
              SharedPrefHelper.getBool(SharedPrefKey.isDarkMode)
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
        ),
        CustomAppButton(
          onTap: () => context.read<AppSettingsCubit>().changeLanguage(),

          width: 100.w,
          child: Text(
            context.tr.language,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: 19.sp,
            ),
          ),
        ),
      ],
    );
  }
}
