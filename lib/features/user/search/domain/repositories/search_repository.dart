import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

abstract class SearchRepository {
  Future<Either<String, ProductsModel>> searchByPrice({
    required int minPrice,
    required int maxPrice,
  });
}
