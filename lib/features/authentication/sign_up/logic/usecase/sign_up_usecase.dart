import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_request_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_responce_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/logic/repository/sign_up_repository.dart';

class SignUpUsecase {
  SignUpUsecase(this._signUpRepository);
  final SignUpRepository _signUpRepository;

  Future<Either<String, SignUpResponceModel>> call({
    required SignUpRequestModel signRequestModel,
  }) async {
    return _signUpRepository.signUpWithEmailAndPassword(
      signRequestModel: signRequestModel,
    );
  }
}
