import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/get_all_products/domain/repositories/get_all_products_repository.dart';

class GetAllProductsUsecase {
  GetAllProductsUsecase(this.getAllProductsRepository);

  final GetAllProductsRepository getAllProductsRepository;
  Future<Either<String, List<ProductDataModel>>> call({required int offset}) =>
      getAllProductsRepository.getAllProducts(offset: offset);
}
