import 'package:flutter/material.dart';

class AppImageExtensions extends ThemeExtension<AppImageExtensions> {
  AppImageExtensions({required this.primaryImage});

  final String primaryImage;
  @override
  ThemeExtension<AppImageExtensions> copyWith({String? primaryImage}) {
    return AppImageExtensions(primaryImage: primaryImage ?? this.primaryImage);
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
