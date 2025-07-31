import 'package:dartz/dartz.dart';

import 'package:sadio_mane_store/features/admin/categories/data/data_source/categories_remote_data_source.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/add_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/updata_category_request_model.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/repository/categories_repository.dart';

class GetCategoriesRepositoryImpl extends CategoriesRepository {
  GetCategoriesRepositoryImpl(this._categoriesRemoteDataSource);
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  @override
  Future<Either<String, GetCategoriesResponceModel>> getCategories() {
    return _categoriesRemoteDataSource.getCategories();
  }

  @override
  Future<Either<String, AddCategoryResponceModel>> addCategories(
    AddCategoriesRequestModel addCategoriesModel,
  ) {
    return _categoriesRemoteDataSource.addCategories(addCategoriesModel);
  }

  @override
  Future<Either<String, String>> deleteCategory(int id) {
    return _categoriesRemoteDataSource.deleteCategory(id);
  }

  @override
  Future<Either<String, String>> updateCategory(
    UpdateCategoryRequestModel model,
  ) {
    return _categoriesRemoteDataSource.updateCategory(model);
  }
}
