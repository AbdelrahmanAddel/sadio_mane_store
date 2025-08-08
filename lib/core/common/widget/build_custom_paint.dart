import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/product_details/presentation/widgets/product_details_custom_painter.dart';

class BuildCustomPaint extends StatelessWidget {
  const BuildCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: ProductDetailsCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.theme.appColors.bluePinkDark,
            context.theme.appColors.bluePinkLight,
          ],
        ),
      ),
    );
  }
}