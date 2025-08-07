import 'dart:ffi';

import 'package:sadio_mane_store/features/user/category_details/data/datasources/category_api_service.dart';
import 'package:sadio_mane_store/features/user/category_details/data/graphql/category_graph.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/category_details_model.dart';

class CategoryRemoteDataSource {
  CategoryRemoteDataSource(this.apiService);
  final CategoriesDetailsApiService apiService;

  Future<List<CategoriesDetailsDataModel>> getProductsByCategoryId(double id) async {
    final response = await apiService.getProductByCategories(
      CategoryGraph.getProductByCategory(id),
    );
    return response.data?.products ?? [];
  }
}
