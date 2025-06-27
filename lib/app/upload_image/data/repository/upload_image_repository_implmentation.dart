import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadio_mane_store/app/upload_image/data/data_source/upload_image_remote_data_source.dart';
import 'package:sadio_mane_store/app/upload_image/data/model/upload_image_responce_model.dart';
import 'package:sadio_mane_store/app/upload_image/logic/repository/upload_image_repository.dart';

class UploadImageRepositoryImplmentation extends UploadImageRepository {
  UploadImageRepositoryImplmentation(this.uploadImageRemoteDataSourc);
  UploadImageRemoteDataSource uploadImageRemoteDataSourc;
  @override
  Future<Either<String, UploadImageResponceModel>> uploadImage(
    XFile imagePath,
  ) async {
    return uploadImageRemoteDataSourc.uploadImage(imagePath);
  }
}
