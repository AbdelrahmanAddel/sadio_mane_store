import 'package:dartz/dartz.dart';

import 'package:sadio_mane_store/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/categories_repository.dart';

class GetCategoriesRepositoryImpl extends CategoriesRepository {
  GetCategoriesRepositoryImpl(this._categoriesRemoteDataSource);
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  @override
  Future<Either<String, GetCategoriesResponceModel>> getCategories() {
    return _categoriesRemoteDataSource.getCategories();
  }

  @override
  Future<Either<String, AddCategoriesResponceModel>> addCategories(
    AddCategoriesRequestModel addCategoriesModel,
  ) {
    return _categoriesRemoteDataSource.addCategories(addCategoriesModel);
  }
}
