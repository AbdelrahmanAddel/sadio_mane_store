
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_colors_extenstion.dart';

class AppLightModeColors {
  static const Color mainColor = Color(0xffFFFFFF);
  static const Color pinkLight = Color(0xFFEE637A);
  static const Color pinkDark = Color(0xFF99162B);
  static const Color black = Color(0xff170605);
  static const Color white = Color(0xffFFFFFF);
  static final lightAppColors = AppColorsExtension(
    mainColor: mainColor,
    bluePinkDark: pinkDark,
    bluePinkLight: pinkLight,
    textColor: black,
    textFormBorder: pinkLight,
    navBarbg: mainColor,
    navBarSelectedTab: pinkDark,
    containerShadow1: white,
    containerShadow2: white,
    containerLinear1: pinkDark,
    containerLinear2: pinkLight,
  );
}
