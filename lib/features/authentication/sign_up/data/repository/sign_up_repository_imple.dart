import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_request_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_responce_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/logic/repository/sign_up_repository.dart';

class SignUpRepositoryImple extends SignUpRepository {
  SignUpRepositoryImple(this.signUpRemoteDataSource);
  final SignUpRemoteDataSourceImpl signUpRemoteDataSource;
  @override
  Future<Either<String, SignUpResponceModel>> signUpWithEmailAndPassword({
    required SignUpRequestModel signRequestModel,
  }) {
    return signUpRemoteDataSource.signUpWithEmailAndPassword(
      signRequestModel: signRequestModel,
    );
  }
}
