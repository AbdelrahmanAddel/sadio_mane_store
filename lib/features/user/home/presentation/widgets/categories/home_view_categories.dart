import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_state.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/categories/states/buid_categories_succes_state.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/categories/states/build_categories_loading_state.dart';

class HomeViewCategories extends StatelessWidget {
  const HomeViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        switch (current) {
          case GetCategoriesSuccessState():
          case GetCategoriesLoadingState():
          case GetCategoriesErrorState():
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        switch (state) {
          case GetCategoriesSuccessState():
            return BuildCategorySuccessState(categories: state.categories);
          case GetCategoriesLoadingState():
            return const BuildCategoriesLoadingState();
          case GetCategoriesErrorState():
            return Center(child: Text(context.tr.something_went_wrong));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
