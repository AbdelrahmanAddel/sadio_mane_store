import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.mainColor,
    required this.bluePinkDark,
    required this.bluePinkLight,
    required this.textColor,
    required this.textFormBorder,
    required this.navBarbg,
    required this.navBarSelectedTab,
    required this.containerShadow1,
    required this.containerShadow2,
    required this.containerLinear1,
    required this.containerLinear2,
  });

  final Color mainColor;
  final Color bluePinkDark;
  final Color bluePinkLight;
  final Color textColor;
  final Color textFormBorder;
  final Color navBarbg;
  final Color navBarSelectedTab;
  final Color containerShadow1;
  final Color containerShadow2;
  final Color containerLinear1;
  final Color containerLinear2;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
    Color? containerLinear2,
  }) {
    return AppColorsExtension(
      mainColor: mainColor ?? this.bluePinkDark,
      bluePinkDark: bluePinkDark ?? this.bluePinkDark,
      bluePinkLight: bluePinkLight ?? this.bluePinkLight,
      textColor: textColor ?? this.textColor,
      textFormBorder: textFormBorder ?? this.textFormBorder,
      navBarbg: navBarbg ?? this.navBarbg,
      navBarSelectedTab: navBarSelectedTab ?? this.navBarSelectedTab,
      containerShadow1: containerShadow1 ?? this.containerShadow1,
      containerShadow2: containerShadow2 ?? this.containerShadow2,
      containerLinear1: containerLinear1 ?? this.containerLinear1,
      containerLinear2: containerLinear2 ?? this.containerLinear2,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
    );
  }
}
