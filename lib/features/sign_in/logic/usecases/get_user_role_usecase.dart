import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sub_models/role_responce_model.dart';
import 'package:sadio_mane_store/features/sign_in/logic/repository/sign_in_repository.dart';

class GetUserRoleUseCase {
  GetUserRoleUseCase(this.signInRepository);
  SignInRepository signInRepository;
  Future<Either<String, RoleResponceModel>> call() {
    return signInRepository.getUserRole();
  }
}
