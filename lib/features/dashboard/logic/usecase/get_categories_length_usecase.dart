import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/dashboard/logic/repository/dashboard_repository.dart';

class GetCategoriesLengthUsecase {
  GetCategoriesLengthUsecase(this._dashboardRepository);
  final DashboardRepository _dashboardRepository;

  Future<Either<String, DashboardCategoriesModel>> call() {
    return _dashboardRepository.getCategoriesTotalNumber();
  }
}
