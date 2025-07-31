import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_users_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/repository/dashboard_repository.dart';

class GetUsersTotalNumberUseCase {
  GetUsersTotalNumberUseCase(this._dashboardRepository);
  final DashboardRepository _dashboardRepository;

  Future<Either<String, DashboardUsersModel>> call() {
    return _dashboardRepository.getUsersTotalNumber();
  }
}
