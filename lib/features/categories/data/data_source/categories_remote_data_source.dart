import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/categories/data/data_source/categories_api_service.dart';
import 'package:sadio_mane_store/features/categories/data/graphql/categories_qraph_body.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';

class CategoriesRemoteDataSource {
  CategoriesRemoteDataSource(this._CategoriesApiService);
  final CategoriesApiService _CategoriesApiService;

  Future<Either<String, GetCategoriesResponceModel>> getCategories() async {
    try {
      final response = await _CategoriesApiService.getCategories(
        CategoriesQraphBody.getCategoriesBody(),
      );
      return Right(response);
    } catch (error, stackTrace) {
      debugPrint('Error in GetCategoriesRemoteDataSource: $error');
      debugPrint('StackTrace: $stackTrace');
      return Left('Failed to fetch categories: $error');
    }
  }

  Future<Either<String, AddCategoryResponceModel>> addCategories(
    AddCategoriesRequestModel addCategoriesModel,
  ) async {
    try {
      final responce = await _CategoriesApiService.addCategory(
        CategoriesQraphBody.addCategoriesBody(addCategoriesModel),
      );
      return Right(responce);
    } catch (error, stackTrace) {
      debugPrint('Error in GetCategoriesRemoteDataSource: $error');
      debugPrint('StackTrace: $stackTrace');
      return Left('Failed to fetch categories: $error');
    }
  }

  Future<Either<String, String>> deleteCategory(int id) async {
    try {
      await _CategoriesApiService.deleteCategory(
        CategoriesQraphBody.deleteCategoryBody(id),
      );
      return const Right('Deleted successfully');
    } catch (error, stackTrace) {
      debugPrint('Error in DeleteCategoryRemoteDataSource: $error');
      debugPrint('StackTrace: $stackTrace');
      return Left('Failed to delete category: $error');
    }
  }
}
