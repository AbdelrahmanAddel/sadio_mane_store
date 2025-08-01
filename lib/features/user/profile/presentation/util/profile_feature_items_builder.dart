import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/custom_feature_item.dart';

class ProfileFeatureItemsBuilder {
  static List<CustomFeatureItem> build(BuildContext context) {
    final isArabic = SharedPrefHelper.getBool(SharedPrefKey.language);
    final isDarkMode = SharedPrefHelper.getBool(SharedPrefKey.isDarkMode);
    final appSettingsCubit = context.watch<AppSettingsCubit>();
    return <CustomFeatureItem>[
      CustomFeatureItem(
        prefixIcon: Icons.language,
        prefixText: context.tr.language,
        suffixText: isArabic ? context.tr.english : context.tr.arabic,
        suffixWidget: _languageIconButton(appSettingsCubit: appSettingsCubit),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.currency_exchange,
        prefixText: context.tr.theme,
        suffixText: isDarkMode ? context.tr.light_mode : context.tr.dark_mode,
        suffixWidget: _darkModeIconButton(appSettingsCubit: appSettingsCubit),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.computer,
        prefixText: context.tr.build_developer,
        suffixText: context.tr.app_name,
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.notifications,
        prefixText: context.tr.notifications,
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.info,
        prefixText: context.tr.build_version,
        suffixText: '1.0.0',
      ),
      CustomFeatureItem(
        prefixIcon: Icons.logout,
        prefixText: context.tr.log_out,
        suffixText: context.tr.log_out,
        suffixWidget: const Icon(Icons.arrow_forward_ios),
      ),
    ];
  }

  static Widget _languageIconButton({
    required AppSettingsCubit appSettingsCubit,
  }) {
    return IconButton(
      onPressed: appSettingsCubit.changeLanguage,
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  static Widget _darkModeIconButton({
    required AppSettingsCubit appSettingsCubit,
  }) {
    return IconButton(
      onPressed: appSettingsCubit.changeAppTheme,
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }
}
