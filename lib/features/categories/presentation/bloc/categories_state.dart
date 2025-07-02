import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';

sealed class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}

final class GetCategoriesLoadingState extends CategoriesState {}

final class GetCategoriesSuccessState extends CategoriesState {
  GetCategoriesSuccessState({required this.categoriesData});

  final List<CategoriesDataModel> categoriesData;
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
