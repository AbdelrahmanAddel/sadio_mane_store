import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/categories/data/model/categories_responce_model.dart';
part 'get_categories_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class GetCategoriesApiService {
  factory GetCategoriesApiService(Dio dio) = _GetCategoriesApiService;

  @POST(ApiEndPoints.graphQl)
  Future<GetCategoriesResponceModel> getCategories(
    @Body() Map<String, dynamic> query,
  );
}
