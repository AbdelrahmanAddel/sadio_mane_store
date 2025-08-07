import 'package:sadio_mane_store/features/user/category_details/data/datasources/category_api_service.dart';
import 'package:sadio_mane_store/features/user/category_details/data/graphql/category_graph.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/get_product_by_category_id_model.dart';

class CategoryRemoteDataSource {
  CategoryRemoteDataSource(this.apiService);
  final CategoriesDetailsApiService apiService;

  Future<GetCategoriesByIdResponseModel> getProductsByCategoryId(
    double id,
  ) async {
    return apiService.getProductByCategories(
      CategoryGraph.getProductByCategory(id),
    );
  }
}
