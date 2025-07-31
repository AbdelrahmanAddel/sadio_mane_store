import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/model/sign_in_responce_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/logic/repository/sign_in_repository.dart';

class SignInUsecase {
  SignInUsecase({required this.signInRepository});
  final SignInRepository signInRepository;

  Future<Either<String, SignInResponceModel>> call(
    SignInRequestBody signInRequestBody,
  ) async {
    return signInRepository.signInWithEmailAndPassword(signInRequestBody);
  }
}
