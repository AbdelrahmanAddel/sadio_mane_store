import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_responce_model.dart';
part 'sign_in_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class SignInApiService {
  factory SignInApiService(Dio dio) = _SignInApiService;

  @POST(ApiEndPoints.graphQl)
  Future<SignInResponceModel> signInWithEmailAndPassword(
    @Body() Map<String, dynamic> query,
  );
}
