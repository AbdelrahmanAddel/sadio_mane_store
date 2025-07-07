import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/products/data/data_source/products_remote_data_source.dart';
import 'package:sadio_mane_store/features/products/data/model/add_products_model.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/logic/repository/product_repository.dart';

class ProductRepositoryImplmentation extends ProductRepository {
  ProductRepositoryImplmentation(this._productsRemoteDataSource);
  final ProductsRemoteDataSource _productsRemoteDataSource;

  @override
  Future<Either<String, ProductsModel>> getProducts() {
    return _productsRemoteDataSource.getProducts();
  }

  @override
  Future<Either<String, String>> addProduct(AddProductsModel productModel) {
    return _productsRemoteDataSource.addProduct(productModel);
  }
}
