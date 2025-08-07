import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/user/category_details/data/datasources/category_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/get_product_by_category_id_model.dart';
import 'package:sadio_mane_store/features/user/category_details/domain/repositories/category_details_repository.dart';

class CategoryDetailsRepositoryImpl extends CategoryDetailsRepository {
  CategoryDetailsRepositoryImpl(this.remoteDataSource);
  final CategoryRemoteDataSource remoteDataSource;

  @override
  Future<Either<String, List<ProductsData>>>getProductsByCategoryId(
    double id,
  ) async {
    try {
      final result = await remoteDataSource.getProductsByCategoryId(id);
      return Right(result.data?.products ?? []);
    } on Exception catch (error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      return Left(error.toString());
    }
  }
}
