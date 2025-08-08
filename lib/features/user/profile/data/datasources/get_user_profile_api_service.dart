import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';
part 'get_user_profile_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class GetUserProfileApiService {
  factory GetUserProfileApiService(Dio dio) = _GetUserProfileApiService;

  @GET(ApiEndPoints.profile)
  Future<UserProfileModel> getUserProfile();
}
