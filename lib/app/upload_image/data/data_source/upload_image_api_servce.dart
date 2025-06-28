import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadio_mane_store/app/upload_image/data/model/upload_image_responce_model.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';

part 'upload_image_api_servce.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class UploadImageApiServce {
  factory UploadImageApiServce(Dio dio) = _UploadImageApiServce;

  @POST(ApiEndPoints.uploadImage)
  Future<UploadImageResponceModel> uploadImage(@Body() FormData imageFile);
}
