import 'dart:ffi';

import 'package:sadio_mane_store/features/user/category_details/data/datasources/category_api_service.dart';
import 'package:sadio_mane_store/features/user/category_details/data/graphql/category_graph.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/category_details_model.dart';

class CategoryRemoteDataSource {
  CategoryRemoteDataSource(this.apiService);
  final CategoriesDetailsApiService apiService;

  Future<List<CategoriesDetailsDataModel>> getCategoryDetails(String id) async {
    final response = await apiService.getCategories(
      CategoryGraph.categoryDetails(96 as Float),
    );
    return response.data?.categories ?? [];
  }
}
