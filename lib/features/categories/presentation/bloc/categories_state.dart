import 'package:sadio_mane_store/features/categories/data/model/categories_responce_model.dart';

sealed class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}

final class LoadingToGetCategoriesState extends CategoriesState {}

final class GetCategoriesSuccessState extends CategoriesState {
  GetCategoriesSuccessState({required this.categoriesData});

  final List<CategoriesDataModel> categoriesData;
}

final class GetCategoriesFailureState extends CategoriesState {
  GetCategoriesFailureState({required this.errorMessage});

  final String errorMessage;
}
