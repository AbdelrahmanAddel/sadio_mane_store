import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/dashboard/data/data_source/dashboard_api_service.dart';
import 'package:sadio_mane_store/features/dashboard/data/graphql/dashboard_qraph_body.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_users_model.dart';

class DashboardRemoteDataSource {
  DashboardRemoteDataSource(this._dashboardApiService);
  final DashboardApiService _dashboardApiService;

  Future<Either<String, DashBoardModel>> getProductsTotalLength() async {
    try {
      final responce = await _dashboardApiService.getProductsTotalLength(
        DashboardQraphBody.getProductsTotalLength(),
      );
      return Right(responce);
    } catch (error, stack) {
      debugPrint('error => $error');
      debugPrint('where => $stack');
      return Left(error.toString());
    }
  }

  Future<Either<String, DashboardUsersModel>> getUsersTotalNumber() async {
    try {
      final responce = await _dashboardApiService.getUsersTotalNumber(
        DashboardQraphBody.getUsersTotalNumber(),
      );
      return Right(responce);
    } catch (error, stack) {
      debugPrint('error => $error');
      debugPrint('where => $stack');
      return Left(error.toString());
    }
  }

  Future<Either<String, DashboardCategoriesModel>>
  getCategoriesTotalNumber() async {
    try {
      final responce = await _dashboardApiService.getCategoriesTotalNumber(
        DashboardQraphBody.getCategoriesTotalNumber(),
      );
      return Right(responce);
    } catch (error, stack) {
      debugPrint('error => $error');
      debugPrint('where => $stack');
      return Left(error.toString());
    }
  }
}
