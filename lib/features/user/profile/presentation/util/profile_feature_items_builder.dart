import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';

import 'package:sadio_mane_store/core/routes/routes_string.dart';
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
        prefixIcon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
        prefixText: context.tr.theme,
        suffixWidget: _darkModeIconButton(
          appSettingsCubit: appSettingsCubit,
          isDarkMode: isDarkMode,
        ),
      ),
      CustomFeatureItem(
        prefixIcon: Icons.computer,
        prefixText: context.tr.build_developer,
        suffixText: context.tr.app_name,
        suffixWidget: _buildDeveloperIconButton(context),
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
    required bool isDarkMode,
  }) {
    return Transform.scale(
      scale: 0.9,
      child: Switch.adaptive(
        value: isDarkMode,
        activeColor: Colors.green,
        onChanged: (value) {
          appSettingsCubit.changeAppTheme();
        },
      ),
    );
  }

  static Widget _buildDeveloperIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pushName(
          routeName: RoutesString.webView,
          arguments: 'https://en.wikipedia.org/wiki/Sadio_Man%C3%A9',
        );
      },
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }
}
