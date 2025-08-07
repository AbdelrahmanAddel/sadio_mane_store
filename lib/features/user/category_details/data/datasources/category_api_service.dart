import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/category_details_model.dart';
part 'category_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class CategoriesDetailsApiService {
  factory CategoriesDetailsApiService(Dio dio) = _CategoriesDetailsApiService;

  @POST(ApiEndPoints.graphQl)
  Future<GetCategoriesDetailsResponseModel> getProductByCategories(
    @Body() Map<String, dynamic> query,
  );
}
