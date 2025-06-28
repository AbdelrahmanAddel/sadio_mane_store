import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadio_mane_store/app/upload_image/data/model/upload_image_responce_model.dart';

abstract class UploadImageRepository {
  Future<Either<String, UploadImageResponceModel>> uploadImage(
    XFile imagePath,
  );
}
