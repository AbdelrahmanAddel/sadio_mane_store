import 'package:flutter/material.dart';

class AppImageExtensions extends ThemeExtension<AppImageExtensions> {
  AppImageExtensions({
    required this.mainBackGround,
    required this.primaryImage,
    required this.bigNavBar,
  });

  final String primaryImage;
  final String mainBackGround;
  final String bigNavBar;
  @override
  ThemeExtension<AppImageExtensions> copyWith({
    String? primaryImage,
    String? mainBackGround,
    String? bigNavBar,
  }) {
    return AppImageExtensions(
      bigNavBar: bigNavBar ?? this.bigNavBar,
      mainBackGround: mainBackGround ?? this.mainBackGround,
      primaryImage: primaryImage ?? this.primaryImage,
    );
  }

  @override
  AppImageExtensions lerp(
    covariant ThemeExtension<AppImageExtensions>? other,
    double t,
  ) {
    if (other is! AppImageExtensions) return this;
    return this;
  }
}
