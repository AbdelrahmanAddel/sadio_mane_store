import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_users_model.dart';

abstract class DashboardRepository {
  Future<Either<String, DashBoardModel>> getProductsTotalLength();
  Future<Either<String,DashboardUsersModel>>getUsersTotalNumber();
  Future<Either<String,DashboardCategoriesModel>>getCategoriesTotalNumber();
}
