import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/colors/app_light_theme_colors.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_colors_extenstion.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_images_extensions.dart';
import 'package:sadio_mane_store/core/theme/images/app_light_mode_images.dart';

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppLightModeColors.lightAppColors;
  AppImageExtensions get appImage =>
      extension<AppImageExtensions>() ?? AppLightModeImages.lightAppImages;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
