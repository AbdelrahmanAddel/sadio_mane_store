import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/categories/data/model/categories_responce_model.dart';

abstract class CategoriesRepository {
  Future<Either<String, GetCategoriesResponceModel>> getCategories();
}
