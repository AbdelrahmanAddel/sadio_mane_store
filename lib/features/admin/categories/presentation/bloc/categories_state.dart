import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';

sealed class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}

final class GetCategoriesLoadingState extends CategoriesState {}

final class GetCategoriesSuccessState extends CategoriesState {
  GetCategoriesSuccessState({required this.categoriesData});

  final GetCategoriesResponceModel categoriesData;
}

final class GetCategoriesFailureState extends CategoriesState {
  GetCategoriesFailureState({required this.errorMessage});

  final String errorMessage;
}

final class AddCategoriesLoadingState extends CategoriesState {}

final class AddCategoriesSuccessState extends CategoriesState {
  AddCategoriesSuccessState({required this.successMessage});
  final String successMessage;
}

final class AddCategoriesFailureState extends CategoriesState {
  AddCategoriesFailureState({required this.errorMessage});

  final String errorMessage;
}

final class DeleteCategoryLoadingState extends CategoriesState {}

final class DeleteCategorySuccessState extends CategoriesState {
  DeleteCategorySuccessState({required this.successMessage});
  final String successMessage;
}

final class DeleteCategoryFailureState extends CategoriesState {
  DeleteCategoryFailureState({required this.errorMessage});
  final String errorMessage;
}

final class UpdateCategoryLoading extends CategoriesState {}

final class UpdateCategorySuccess extends CategoriesState {
  UpdateCategorySuccess({required this.successMessage});

  final String successMessage;
}

final class UpdateCategoryFailure extends CategoriesState {
  UpdateCategoryFailure({required this.errorMessage});

  final String errorMessage;
}
