import 'package:dartz/dartz.dart';

import 'package:sadio_mane_store/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/categories_repository.dart';

class GetCategoriesRepositoryImpl extends CategoriesRepository {
  GetCategoriesRepositoryImpl(this.getCategoriesRemoteDataSource);
  CategoriesRemoteDataSource getCategoriesRemoteDataSource;
  @override
  Future<Either<String, GetCategoriesResponceModel>> getCategories() {
    return getCategoriesRemoteDataSource.getCategories();
  }
}
