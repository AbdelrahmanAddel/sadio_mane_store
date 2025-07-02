import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/categories_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.mainColor,

      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        backgroundColor: context.theme.appColors.mainColor,
      ),
      body: const CategoriesBody(),
    );
  }
}
