import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/states/failure_to_get_categories_state.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/states/get_categories_success_state.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/states/loading_to_categories_state.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listenWhen: (previous, current) {
        return current is DeleteCategoryFailureState ||
            current is DeleteCategorySuccessState ||
            current is AddCategoriesSuccessState;
      },
      buildWhen: (previous, current) {
        switch (current) {
          case GetCategoriesLoadingState():
            return true;
          case GetCategoriesSuccessState():
            return true;
          case GetCategoriesFailureState():
            return true;
          case DeleteCategoryLoadingState():
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return switch (state) {
          GetCategoriesLoadingState() => Expanded(
            child: loadingToGetCategoriesScreen(),
          ),
          GetCategoriesSuccessState() => Expanded(
            child: getCategoriesSuccessScreen(state, context),
          ),
          GetCategoriesFailureState() => failureToGetCategoriesScreen(),
          DeleteCategoryLoadingState() => const Center(
            child: CircularProgressIndicator(),
          ),

          _ => const SizedBox.shrink(),
        };
      },
      listener: (BuildContext context, CategoriesState state) {
        switch (state) {
          case DeleteCategoryFailureState():
            customFlutterToast(message: 'Failed to delete category');

          case DeleteCategorySuccessState():
            customFlutterToast(
              message: 'Category deleted successfully',
              backgroundColor: Colors.green,
            );
          case AddCategoriesSuccessState():
            customFlutterToast(
              message: 'Category added successfully',
              backgroundColor: Colors.green,
            );
            context.read<CategoriesBloc>().add(GetCategoriesEvent());
          default:
            break;
        }
      },
    );
  }
}
