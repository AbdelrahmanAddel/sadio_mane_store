import 'package:dartz/dartz.dart';

import 'package:sadio_mane_store/features/categories/data/data_source/get_categories_remote_data_source.dart';
import 'package:sadio_mane_store/features/categories/data/model/categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/get_categories_repository.dart';

class GetCategoriesRepositoryImpl extends GetCategoriesRepository {
  GetCategoriesRepositoryImpl( this.getCategoriesRemoteDataSource);
  GetCategoriesRemoteDataSource getCategoriesRemoteDataSource;
  @override
  Future<Either<String, GetCategoriesResponceModel>> getCategories() {
    return getCategoriesRemoteDataSource.getCategories();
  }
}
