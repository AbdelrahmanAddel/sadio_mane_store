import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/banner_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
  @POST(ApiEndPoints.graphQl)
  Future<BannerModel> getBanners(@Body() Map<String, dynamic> query);
  @POST(ApiEndPoints.graphQl)
  Future<GetCategoriesResponseModel> getCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiEndPoints.graphQl)
  Future<ProductsModel> getProducts(@Body() Map<String, dynamic> query);
}
