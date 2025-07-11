import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/users/data/model/get_users_responce_model.dart';
part 'users_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class UsersApiService {
  factory UsersApiService(Dio dio) = _UsersApiService;

  @POST(ApiEndPoints.graphQl)
  Future<GetUsersResponceModel> getUsers(@Body() Map<String, dynamic> query);
  @POST(ApiEndPoints.graphQl)
  Future<void> deleteUserById(@Body() Map<String, dynamic> query);
}
