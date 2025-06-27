import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadio_mane_store/app/upload_image/data/model/upload_image_responce_model.dart';
import 'package:sadio_mane_store/app/upload_image/logic/repository/upload_image_repository.dart';

class UploadImageUsecase {
  UploadImageUsecase(this._repository);
  final UploadImageRepository _repository;

  Future<Either<String, UploadImageResponceModel>> call(XFile image) async {
    return _repository.uploadImage(image);
  }
}
