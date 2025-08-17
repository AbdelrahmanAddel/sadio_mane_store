import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/search/domain/repositories/search_repository.dart';

class SearchByPriceUsecase {
  SearchByPriceUsecase(this._searchRepository);
  final SearchRepository _searchRepository;

  Future<Either<String, ProductsModel>> call({
    required int minPrice,
    required int maxPrice,
  }) async =>
      _searchRepository.searchByPrice(minPrice: minPrice, maxPrice: maxPrice);
}
