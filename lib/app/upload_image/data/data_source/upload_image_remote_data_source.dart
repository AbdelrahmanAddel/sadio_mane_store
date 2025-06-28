import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadio_mane_store/app/upload_image/data/data_source/upload_image_api_servce.dart';
import 'package:sadio_mane_store/app/upload_image/data/model/upload_image_responce_model.dart';

class UploadImageRemoteDataSource {
  UploadImageRemoteDataSource(this.uploadImageApiServce);
  UploadImageApiServce uploadImageApiServce;

  Future<Either<String, UploadImageResponceModel>> uploadImage(
    XFile imageFile,
  ) async {
    try {
      final fromData = FormData();

      fromData.files.add(
        MapEntry('file', await MultipartFile.fromFile(imageFile.path)),
      );
      final responce = await uploadImageApiServce.uploadImage(fromData);
      return Right(responce);
    } catch (error, stack) {
      debugPrint('error => $error');
      debugPrint('where  => $stack');

      return Left(error.toString());
    }
  }
}
