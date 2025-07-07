import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_admin_app_bar.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/product_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.mainColor,

      appBar: CustomAdminAppBar(
        backGrounfColor: context.theme.appColors.mainColor,
        title: 'Products',
        isMain: true,
      ),

      body: BlocProvider(
        create: (context) => getIt<ProductBloc>()..add(GetProductEvent()),
        child: const ProductsViewBody(),
      ),
    );
  }
}
