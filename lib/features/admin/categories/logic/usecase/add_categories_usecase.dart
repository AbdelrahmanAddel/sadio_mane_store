import 'package:dartz/dartz.dart';

import 'package:sadio_mane_store/features/admin/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/add_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/repository/categories_repository.dart';

class AddCategoriesUsecase {
  AddCategoriesUsecase(this._categoriesRepository);
  final CategoriesRepository _categoriesRepository;
  Future<Either<String, AddCategoryResponceModel>> call(
    AddCategoriesRequestModel addCategoriesModel,
  ) {
    return _categoriesRepository.addCategories(addCategoriesModel);
  }
}
