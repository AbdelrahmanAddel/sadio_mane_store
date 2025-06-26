import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_remote_data_source.dart.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_responce_model.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sub_models/role_responce_model.dart';
import 'package:sadio_mane_store/features/sign_in/logic/repository/sign_in_repository.dart';

class SignInRepositoryImplementation extends SignInRepository {
  SignInRepositoryImplementation({required this.signInRemoteDataSource});
  SignInRemoteDataSource signInRemoteDataSource;

  @override
  Future<Either<String, SignInResponceModel>> signInWithEmailAndPassword(
    SignInRequestBody signInRequestBody,
  ) async {
    return signInRemoteDataSource.signInWithEmailAndPassword(
      signInRequestBody: signInRequestBody,
    );
  }

  @override
  Future<Either<String, RoleResponceModel>> getUserRole() {
    return signInRemoteDataSource.getUserRole();
  }
}
