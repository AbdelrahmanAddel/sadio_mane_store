import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/custom_feature_item.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/feature_item_factory.dart';

class ProfileFeatureItemsBuilder {
  static Future<List<CustomFeatureItem>> build(BuildContext context) async {
    final appSettingsCubit = context.watch<AppSettingsCubit>();
    final currentLanguage = SharedPrefHelper.getBool(SharedPrefKey.language);
    final currentTheme = SharedPrefHelper.getBool(SharedPrefKey.isDarkMode);

    return [
      FeatureItemFactory.buildLanguageItem(context, appSettingsCubit, currentLanguage),
      FeatureItemFactory.buildThemeItem(context, appSettingsCubit, currentTheme),
      FeatureItemFactory.buildDeveloperItem(context),
      FeatureItemFactory.buildNotificationItem(),
      await FeatureItemFactory.buildVersionItem(context),
      FeatureItemFactory.buildLogoutItem(context),
    ];
  }
}
