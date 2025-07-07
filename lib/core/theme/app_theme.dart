import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/core/theme/colors/app_dark_theme_colors.dart';
import 'package:sadio_mane_store/core/theme/colors/app_light_theme_colors.dart';
import 'package:sadio_mane_store/core/theme/images/app_dark_mode_images.dart';
import 'package:sadio_mane_store/core/theme/images/app_light_mode_images.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  extensions: [
    AppLightModeColors.lightAppColors,
    AppLightModeImages.lightAppImages,
  ],
  textTheme: TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: SharedPrefHelper.getString(SharedPrefKey.fontFamily),
      fontWeight: FontWeight.w300,
      color: AppLightModeColors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  extensions: [
    AppDarkModeColors.darkAppColors,
    AppDarkModeImages.darkAppImages,
  ],
  textTheme: TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: SharedPrefHelper.getString(SharedPrefKey.fontFamily),
      fontWeight: FontWeight.w300,
      color: AppDarkModeColors.white,
    ),
  ),
);
