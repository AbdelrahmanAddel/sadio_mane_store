import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

abstract class GetAllProductsRepository {
  Future<Either<String, List<ProductDataModel>>> getAllProducts({required int offset});
}
