import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';

abstract class CategoryDetailsRepository {
  Future<Either<String, List<ProductsData>>> getProductsByCategoryId(
    double id,
  );
}