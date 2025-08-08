import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/domain/repositories/home_repositry.dart';

class GetHomeProductsUsecase {
  GetHomeProductsUsecase(this.homeRepository);

  final HomeRepository homeRepository;

  Future<Either<String, List<ProductDataModel>>> call() async =>
      homeRepository.getProducts();
}
