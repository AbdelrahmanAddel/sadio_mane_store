import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_admin_app_bar.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widget/categories/categories_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.mainColor,

      appBar: CustomAdminAppBar(
        backGroundColor: context.theme.appColors.mainColor,
        title: 'Categories',
        isMain: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
        child: const CategoriesBody(),
      ),
    );
  }
}
