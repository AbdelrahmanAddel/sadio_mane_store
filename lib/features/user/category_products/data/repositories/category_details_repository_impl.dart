import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/user/category_products/data/datasources/category_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';
import 'package:sadio_mane_store/features/user/category_products/domain/repositories/category_details_repository.dart';

class CategoryDetailsRepositoryImpl extends CategoryDetailsRepository {
  CategoryDetailsRepositoryImpl(this.remoteDataSource);
  final CategoryRemoteDataSource remoteDataSource;

  @override
  Future<Either<String, List<ProductsData>>> getProductsByCategoryId(
    double id,
  ) async {
    try {
      final result = await remoteDataSource.getProductsByCategoryId(id);

      debugPrint('API Response: $result');
      debugPrint('Data: ${result.data}');
      debugPrint('Products: ${result.data?.products}');

      if (result.data?.products == null) {
        return const Left('No products found for this category');
      }

      return Right(result.data!.products!);
    } catch (error, stackTrace) {
      debugPrint('Error in getProductsByCategoryId: $error');
      debugPrint('StackTrace: $stackTrace');
      return Left('Failed to load products: $error');
    }
  }
}
