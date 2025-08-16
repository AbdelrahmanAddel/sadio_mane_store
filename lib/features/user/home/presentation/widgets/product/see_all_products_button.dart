import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class SeeAllProductsButton extends StatelessWidget {
  const SeeAllProductsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MaterialButton(
        color: context.theme.appColors.bluePinkLight,
        onPressed: () {
          context.pushName(routeName: RoutesString.getAllProduct);
        },
        child: Text(
          context.tr.see_all_products,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
