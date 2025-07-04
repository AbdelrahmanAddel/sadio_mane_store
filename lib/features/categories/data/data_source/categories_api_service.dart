import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/categories/data/model/add_categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/delete_category_responce_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/get_categories_responce_model.dart';
part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio) = _CategoriesApiService;

  @POST(ApiEndPoints.graphQl)
  Future<GetCategoriesResponceModel> getCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiEndPoints.graphQl)
  Future<AddCategoryResponceModel> addCategory(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiEndPoints.graphQl)
  Future<DeleteCategoryResponceModel> deleteCategory(
    @Body() Map<String, dynamic> query,
  );
}
