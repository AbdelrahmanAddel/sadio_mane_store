import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/products/data/model/add_products_model.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';

abstract class ProductRepository {
  Future<Either<String, ProductsModel>> getProducts();
  Future<Either<String, String>> addProduct(AddProductsModel productModel);
  Future<Either<String, String>> deleteProduct(int id);
}
