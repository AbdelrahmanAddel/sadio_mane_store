import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_users_model.dart';
part 'dashboard_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  @POST(ApiEndPoints.graphQl)
  Future<DashBoardModel> getProductsTotalLength(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiEndPoints.graphQl)
  Future<DashboardUsersModel> getUsersTotalNumber(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiEndPoints.graphQl)
  Future<DashboardCategoriesModel> getCategoriesTotalNumber(
    @Body() Map<String, dynamic> query,
  );
}
