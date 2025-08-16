import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/get_all_products/data/datasources/get_all_product_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/get_all_products/domain/repositories/get_all_products_repository.dart';

class GetAllProductsRepositoryImpl extends GetAllProductsRepository {
  GetAllProductsRepositoryImpl(this._getAllProductRemoteDataSource);

  final GetAllProductRemoteDataSource _getAllProductRemoteDataSource;

  @override
  Future<Either<String, List<ProductDataModel>>> getAllProducts({
    required int offset,
  }) async {
    try {
      final response = await _getAllProductRemoteDataSource.getAllProducts(
        offset: offset,
      );

      return Right(response.data?.products ?? []);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
