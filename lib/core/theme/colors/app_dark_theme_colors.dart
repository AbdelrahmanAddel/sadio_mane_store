import 'dart:ui';

import 'package:sadio_mane_store/core/theme/extensions/app_colors_extenstion.dart';

class AppDarkModeColors {
  static const Color mainColor = Color(0xFF242C3B);
  static const Color blueLight = Color(0xFF37B6E9);
  static const Color blueDark = Color(0xFF4B4CED);
  static const Color navBarDark = Color(0xff2b3361);
  static const Color white = Color(0xFFffffff);
  static const Color black1 = Color(0xff353F54);
  static const Color black2 = Color(0xff222834);
  static final darkAppColors = AppColorsExtension(
    mainColor: mainColor,
    bluePinkDark: blueDark,
    bluePinkLight: blueLight,
    textColor: white,
    textFormBorder: blueLight,
    navBarbg: navBarDark,
    navBarSelectedTab: white,
    containerShadow1: black1,
    containerShadow2: black2,
    containerLinear1: black1,
    containerLinear2: black2,
  );
}
