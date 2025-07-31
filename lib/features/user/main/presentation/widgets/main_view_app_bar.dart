import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

AppBar mainScreenAppBar(BuildContext context) {
  final theme = context.theme;

  return AppBar(
    backgroundColor: theme.appColors.mainColor,

    title: FadeInLeft(
      child: Row(
        children: [
          Text(
            context.tr.choose_your_products,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const CustomAppButton(child: Icon(Icons.search, size: 30)),
          ),
        ],
      ),
    ),
  );
}
