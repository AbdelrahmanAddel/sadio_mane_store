import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/products/data/data_source/product_api_service.dart';
import 'package:sadio_mane_store/features/products/data/graphql/product_qraph.dart';
import 'package:sadio_mane_store/features/products/data/model/add_products_model.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/products/data/model/update_product_model.dart';

class ProductsRemoteDataSource {
  ProductsRemoteDataSource(this._productApiService);
  final ProductApiService _productApiService;

  Future<Either<String, ProductsModel>> getProducts() async {
    try {
      final responce = await _productApiService.getProducts(
        ProductQraph.getProductsBody(),
      );
      return Right(responce);
    } catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
      return Left(error.toString());
    }
  }

  Future<Either<String, String>> addProduct(
    AddProductsModel productModel,
  ) async {
    try {
      await _productApiService.addProduct(
        ProductQraph.addProductBody(productModel),
      );
      return const Right('Product added successfully');
    } catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
      return Left(error.toString());
    }
  }

  Future<Either<String, String>> deleteProduct(int id) async {
    if (id <= 0) {
      return const Left('Invalid product id');
    }
    try {
      await _productApiService.deleteProductById(
        ProductQraph.deleteProductBody(id),
      );
      return const Right('Product deleted successfully');
    } catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
      return Left(error.toString());
    }
  }

  Future<Either<String, String>> updateProduct({
    required UpdateProductModel productModel,
    required int id,
  }) async {
    if (id <= 0) {
      return const Left('Invalid product id');
    }
    try {
      await _productApiService.updateProductById(
        ProductQraph.updateProductBody(id, productModel),
      );
      return const Right('Product updated successfully');
    } catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
      return Left(error.toString());
    }
  }
}
