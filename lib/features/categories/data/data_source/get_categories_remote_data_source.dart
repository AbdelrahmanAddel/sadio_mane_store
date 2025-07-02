import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/categories/data/data_source/get_categories_api_service.dart';
import 'package:sadio_mane_store/features/categories/data/graphql/get_categories_qraph_body.dart';
import 'package:sadio_mane_store/features/categories/data/model/categories_responce_model.dart';

class GetCategoriesRemoteDataSource {
  GetCategoriesRemoteDataSource(this._getCategoriesApiService);
  final GetCategoriesApiService _getCategoriesApiService;

  Future<Either<String, GetCategoriesResponceModel>> getCategories() async {
    try {
      final response = await _getCategoriesApiService.getCategories(
        GetCategoriesQraphBody.getCategoriesBody(),
      );
      return Right(response);
    } catch (error, stackTrace) {
      debugPrint('Error in GetCategoriesRemoteDataSource: $error');
      debugPrint('StackTrace: $stackTrace');
      return Left('Failed to fetch categories: $error');
    }
  }
}
