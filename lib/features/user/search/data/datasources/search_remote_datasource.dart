import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/search/data/datasources/search_api_service.dart';
import 'package:sadio_mane_store/features/user/search/data/graphql/search_body.dart';

class SearchRemoteDataSource {
  SearchRemoteDataSource(this._searchApiService);
  final SearchApiService _searchApiService;

  Future<ProductsModel> searchByPrice({
    required int minPrice,
    required int maxPrice,
  }) async => _searchApiService.searchByPriceOrTitle(
    SearchBody.searchByPriceBody(minPrice: minPrice, maxPrice: maxPrice),
  );
  Future<ProductsModel> searchByTitle({required String title}) {
    return _searchApiService.searchByPriceOrTitle(
      SearchBody.searchByProductTitle(title: title),
    );
  }
}
