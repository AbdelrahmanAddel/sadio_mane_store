import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/screens/app_info.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/custom_feature_item.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/logout_dialog.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/notification_toggle_widget.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/toggle_buttons.dart'
    as profile_toggles;

class FeatureItemFactory {
  static CustomFeatureItem buildLanguageItem(
    BuildContext context,
    AppSettingsCubit appSettingsCubit,
    bool isArabic,
  ) {
    return CustomFeatureItem(
      prefixIcon: Icons.language,
      prefixText: context.tr.language,
      suffixText: isArabic ? context.tr.english : context.tr.arabic,
      suffixWidget: profile_toggles
          .ProfileToggleButtons.buildLanguageToggleButton(appSettingsCubit),
    );
  }

  static CustomFeatureItem buildThemeItem(
    BuildContext context,
    AppSettingsCubit appSettingsCubit,
    bool isDarkMode,
  ) {
    return CustomFeatureItem(
      prefixIcon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
      prefixText: context.tr.theme,
      suffixWidget: profile_toggles.ProfileToggleButtons.buildThemeToggleButton(
        appSettingsCubit,
        isDarkMode,
      ),
    );
  }

  static CustomFeatureItem buildDeveloperItem(BuildContext context) {
    return CustomFeatureItem(
      prefixIcon: Icons.computer,
      prefixText: context.tr.build_developer,
      suffixText: context.tr.app_name,
      suffixWidget: profile_toggles
          .ProfileToggleButtons.buildDeveloperToggleButton(context),
    );
  }

  static CustomFeatureItem buildNotificationItem() {
    return const CustomFeatureItem(
      prefixIcon: Icons.notifications,
      prefixText: 'Notifications',
      suffixWidget: NotificationToggleWidget(),
    );
  }

  static Future<CustomFeatureItem> buildVersionItem(
    BuildContext context,
  ) async {
    return CustomFeatureItem(
      prefixIcon: Icons.info,
      prefixText: context.tr.build_version,
      suffixText: await AppInfo.instance.getAppVersion(),
    );
  }

  static CustomFeatureItem buildLogoutItem(BuildContext context) {
    return CustomFeatureItem(
      prefixIcon: Icons.logout,
      prefixText: context.tr.log_out,
      suffixText: context.tr.log_out,
      suffixWidget: IconButton(
        onPressed: () => LogoutDialog.show(context),
        icon: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
