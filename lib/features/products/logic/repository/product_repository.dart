import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';

abstract class ProductRepository {
  Future<Either<String, ProductsModel>> getProducts();
}
