import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio) = _SearchApiService;
  @POST(ApiEndPoints.graphQl)
  Future<ProductsModel> searchByPrice(@Body() Map<String, dynamic> query);
}
