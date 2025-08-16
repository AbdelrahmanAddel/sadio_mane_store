// getAllProductBody
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
part 'get_all_product_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class GetAllProductApiService {
  factory GetAllProductApiService(Dio dio) = _GetAllProductApiService;

  @POST(ApiEndPoints.graphQl)
  Future<ProductsModel> getProductByCategories(
    @Body() Map<String, dynamic> query,
  );
}
