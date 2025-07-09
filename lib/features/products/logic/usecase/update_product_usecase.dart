import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/products/data/model/update_product_model.dart';
import 'package:sadio_mane_store/features/products/logic/repository/product_repository.dart';

class UpdateProductUsecase {
  UpdateProductUsecase(this._productRepository);
  final ProductRepository _productRepository;

  Future<Either<String, String>> call({
    required int id,
    required UpdateProductModel product,
  }) {
    return _productRepository.updateProduct(id, product);
  }
}
