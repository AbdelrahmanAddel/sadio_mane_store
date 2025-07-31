import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/add_products_model.dart';
import 'package:sadio_mane_store/features/admin/products/logic/repository/product_repository.dart';

class AddProductUsecase {
  AddProductUsecase(this._productsRepo);
  final ProductRepository _productsRepo;

  Future<Either<String, String>> call(AddProductsModel productModel) async {
    return _productsRepo.addProduct(productModel);
  }
}
