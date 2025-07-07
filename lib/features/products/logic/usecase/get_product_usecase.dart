import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/logic/repository/product_repository.dart';

class GetProductUsecase {
  GetProductUsecase(this._productsRepo);
  final ProductRepository _productsRepo;

  Future<Either<String, ProductsModel>> call() async {
    return _productsRepo.getProducts();
  }
}
