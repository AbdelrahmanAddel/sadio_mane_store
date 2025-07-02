import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';

abstract class CategoriesRepository {
  Future<Either<String, GetCategoriesResponceModel>> getCategories();
  Future<Either<String, AddCategoriesResponceModel>> addCategories(
    AddCategoriesRequestModel addCategoriesModel,
  );
}
