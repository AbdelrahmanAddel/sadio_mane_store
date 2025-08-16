import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/search/data/datasources/search_remote_datasource.dart';
import 'package:sadio_mane_store/features/user/search/domain/repositories/search_repository.dart';

class SearchRepositoryImp extends SearchRepository {
  SearchRepositoryImp(this._searchDataSource);
  final SearchRemoteDataSource _searchDataSource;
  @override
  Future<Either<String, ProductsModel>> searchByPrice({
    required int minPrice,
    required int maxPrice,
  }) async {
    try {
      final response = await _searchDataSource.searchByPrice(
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      return right(response);
    } catch (error) {
      return left(error.toString());
    }
  }
}
