import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_request_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_responce_model.dart';

abstract class SignUpRepository {
  Future<Either<String, SignUpResponceModel>> signUpWithEmailAndPassword({
    required SignUpRequestModel signRequestModel,
  });
}
