import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';
import 'package:sadio_mane_store/features/user/category_products/domain/repositories/category_details_repository.dart';

class GetProductByCategoryIdUsecase {
  GetProductByCategoryIdUsecase(this.repository);
  final CategoryDetailsRepository repository;

  Future<Either<String, List<ProductsData>>> call(double id) async {
    return repository.getProductsByCategoryId(id);
  }
}