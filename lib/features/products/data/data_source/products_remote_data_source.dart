import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/products/data/data_source/product_api_service.dart';
import 'package:sadio_mane_store/features/products/data/graphql/product_qraph.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';

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
}
