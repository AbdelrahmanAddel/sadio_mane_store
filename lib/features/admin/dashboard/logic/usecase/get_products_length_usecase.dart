import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/repository/dashboard_repository.dart';

class GetProductsLengthUsecase {
  GetProductsLengthUsecase(this._dashBoardRepository);
  final DashboardRepository _dashBoardRepository;

  Future<Either<String, DashBoardModel>> call() async {
    return _dashBoardRepository.getProductsTotalLength();
  }
}
