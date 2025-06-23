import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/constants/fonts_string.dart';
import 'package:sadio_mane_store/core/theme/colors/app_dark_theme_colors.dart';
import 'package:sadio_mane_store/core/theme/colors/app_light_theme_colors.dart';
import 'package:sadio_mane_store/core/theme/images/app_dark_mode_images.dart';
import 'package:sadio_mane_store/core/theme/images/app_light_mode_images.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  extensions: [
    AppLightModeColors.lightAppColors,
    AppLightModeImages.lightAppImages,
  ],
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: FontsString.cairo,
      fontWeight: FontWeight.w300,
      color: AppLightModeColors.black,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  extensions: [
    AppDarkModeColors.darkAppColors,
    AppDarkModeImages.darkAppImages,
  ],
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      fontFamily: FontsString.poppins,
      fontWeight: FontWeight.w300,
      color: AppDarkModeColors.white,
    ),
  ),
);
