import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/model/sign_in_responce_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/model/sub_models/role_responce_model.dart';

abstract class SignInRepository {
  Future<Either<String, SignInResponceModel>> signInWithEmailAndPassword(
    SignInRequestBody signInRequestBody,
  );
  Future<Either<String, RoleResponceModel>> getUserRole();
}
