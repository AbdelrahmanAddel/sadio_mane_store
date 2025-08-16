import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/get_all_products/data/datasources/get_all_product_api_service.dart';
import 'package:sadio_mane_store/features/user/get_all_products/data/graphql/get_all_product_graph.dart';

class GetAllProductRemoteDataSource {
  GetAllProductRemoteDataSource(this._getAllProductApiService);

  final GetAllProductApiService _getAllProductApiService;
  Future<ProductsModel> getAllProducts({required int offset}) =>
      _getAllProductApiService.getProductByCategories(
        GetAllProductGraph.getAllProductBody(offset: offset),
      );
}
