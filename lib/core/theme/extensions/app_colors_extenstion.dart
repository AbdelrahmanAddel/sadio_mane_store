import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({required this.primaryColor});

  final Color primaryColor;
  @override
  ThemeExtension<AppColorsExtension> copyWith({Color? primaryColor}) {
    return AppColorsExtension(primaryColor: primaryColor ?? this.primaryColor);
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
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
    );
  }
}
