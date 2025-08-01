import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/custom_feature_item.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/notification_toggle_widget.dart';

class ProfileFeatureItemsBuilder {
  static List<CustomFeatureItem> build(BuildContext context) {
    final appSettingsCubit = context.watch<AppSettingsCubit>();
    final currentLanguage = SharedPrefHelper.getBool(SharedPrefKey.language);
    final currentTheme = SharedPrefHelper.getBool(SharedPrefKey.isDarkMode);

    return [
      _buildLanguageItem(context, appSettingsCubit, currentLanguage),
      _buildThemeItem(context, appSettingsCubit, currentTheme),
      _buildDeveloperItem(context),
      _buildNotificationItem(),
      _buildVersionItem(context),
      _buildLogoutItem(context),
    ];
  }

  static CustomFeatureItem _buildLanguageItem(
    BuildContext context,
    AppSettingsCubit appSettingsCubit,
    bool isArabic,
  ) {
    return CustomFeatureItem(
      prefixIcon: Icons.language,
      prefixText: context.tr.language,
      suffixText: isArabic ? context.tr.english : context.tr.arabic,
      suffixWidget: _buildLanguageToggleButton(appSettingsCubit),
    );
  }

  static CustomFeatureItem _buildThemeItem(
    BuildContext context,
    AppSettingsCubit appSettingsCubit,
    bool isDarkMode,
  ) {
    return CustomFeatureItem(
      prefixIcon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
      prefixText: context.tr.theme,
      suffixWidget: _buildThemeToggleButton(appSettingsCubit, isDarkMode),
    );
  }

  static CustomFeatureItem _buildDeveloperItem(BuildContext context) {
    return CustomFeatureItem(
      prefixIcon: Icons.computer,
      prefixText: context.tr.build_developer,
      suffixText: context.tr.app_name,
      suffixWidget: _buildDeveloperToggleButton(context),
    );
  }

  static CustomFeatureItem _buildNotificationItem() {
    return const CustomFeatureItem(
      prefixIcon: Icons.notifications,
      prefixText: 'Notifications', 
      suffixWidget: NotificationToggleWidget(),
    );
  }

  static CustomFeatureItem _buildVersionItem(BuildContext context) {
    return CustomFeatureItem(
      prefixIcon: Icons.info,
      prefixText: context.tr.build_version,
      suffixText: '1.0.0',
    );
  }

  static CustomFeatureItem _buildLogoutItem(BuildContext context) {
    return CustomFeatureItem(
      prefixIcon: Icons.logout,
      prefixText: context.tr.log_out,
      suffixText: context.tr.log_out,
      suffixWidget: const Icon(Icons.arrow_forward_ios),
    );
  }

  static Widget _buildLanguageToggleButton(AppSettingsCubit appSettingsCubit) {
    return IconButton(
      onPressed: appSettingsCubit.changeLanguage,
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  static Widget _buildThemeToggleButton(
    AppSettingsCubit appSettingsCubit,
    bool isDarkMode,
  ) {
    return Transform.scale(
      scale: 0.9,
      child: Switch.adaptive(
        value: isDarkMode,
        onChanged: (_) => appSettingsCubit.changeAppTheme(),
      ),
    );
  }

  static Widget _buildDeveloperToggleButton(BuildContext context) {
    return IconButton(
      onPressed: () => _navigateToDeveloperPage(context),
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  static void _navigateToDeveloperPage(BuildContext context) {
    context.pushName(
      routeName: RoutesString.webView,
      arguments: 'https://en.wikipedia.org/wiki/Sadio_Man%C3%A9',
    );
  }
}
