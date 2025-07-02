import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/categories/data/data_source/categories_api_service.dart';
import 'package:sadio_mane_store/features/categories/data/graphql/categories_qraph_body.dart';
import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';

class CategoriesRemoteDataSource {
  CategoriesRemoteDataSource(this._getCategoriesApiService);
  final CategoriesApiService _getCategoriesApiService;

  Future<Either<String, GetCategoriesResponceModel>> getCategories() async {
    try {
      final response = await _getCategoriesApiService.getCategories(
        CategoriesQraphBody.getCategoriesBody(),
      );
      return Right(response);
    } catch (error, stackTrace) {
      debugPrint('Error in GetCategoriesRemoteDataSource: $error');
      debugPrint('StackTrace: $stackTrace');
      return Left('Failed to fetch categories: $error');
    }
  }
}
