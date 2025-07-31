import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_users_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/repository/dashboard_repository.dart';

class DashboardRepositoryImplmentation extends DashboardRepository {
  DashboardRepositoryImplmentation(this._dashboardRemoteDataSource);
  final DashboardRemoteDataSource _dashboardRemoteDataSource;

  @override
  Future<Either<String, DashBoardModel>> getProductsTotalLength() async {
    return _dashboardRemoteDataSource.getProductsTotalLength();
  }

  @override
  Future<Either<String, DashboardUsersModel>> getUsersTotalNumber() {
    return _dashboardRemoteDataSource.getUsersTotalNumber();

  }

  @override
  Future<Either<String, DashboardCategoriesModel>> getCategoriesTotalNumber() {
    return _dashboardRemoteDataSource.getCategoriesTotalNumber();
  }
}
