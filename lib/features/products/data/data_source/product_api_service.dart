import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/products/data/model/add_product_responce_model.dart';
import 'package:sadio_mane_store/features/products/data/model/products_model.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @POST(ApiEndPoints.graphQl)
  Future<ProductsModel> getProducts(@Body() Map<String, dynamic> query);
  @POST(ApiEndPoints.graphQl)
  Future<AddProductResponceModel> addProduct(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiEndPoints.graphQl)
  Future<void> deleteProductById(@Body() Map<String, dynamic> query);
  @POST(ApiEndPoints.graphQl)
  Future<void> updateProductById(@Body() Map<String, dynamic> query);
}
