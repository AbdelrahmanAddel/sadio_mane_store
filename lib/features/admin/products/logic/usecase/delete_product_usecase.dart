import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/logic/repository/product_repository.dart';

class DeleteProductUsecase {
  DeleteProductUsecase(this._productRepository);

  final ProductRepository _productRepository;

  Future<Either<String, String>> call(int id) async =>
      _productRepository.deleteProduct(id);
}
