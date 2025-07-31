import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_responce_model.dart';

part 'sign_up_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
// ignore: one_member_abstracts
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio) = _SignUpApiService;

  @POST(ApiEndPoints.graphQl)
  Future<SignUpResponceModel> signUpWithEmailAndPassword(
    @Body() Map<String, dynamic> query,
  );
}
