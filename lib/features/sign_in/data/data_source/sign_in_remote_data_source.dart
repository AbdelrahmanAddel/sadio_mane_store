import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_api_service.dart';
import 'package:sadio_mane_store/features/sign_in/data/graphql/sign_in_qureys.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_responce_model.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sub_models/role_responce_model.dart';

abstract class SignInRemoteDataSource {
  Future<Either<String, SignInResponceModel>> signInWithEmailAndPassword({
    required SignInRequestBody signInRequestBody,
  });
  Future<Either<String, RoleResponceModel>> getUserRole();
}

class SignInRemoteDataSourceImplemtation extends SignInRemoteDataSource {
  SignInRemoteDataSourceImplemtation(this._signInApiService);
  final SignInApiService _signInApiService;
  @override
  Future<Either<String, SignInResponceModel>> signInWithEmailAndPassword({
    required SignInRequestBody signInRequestBody,
  }) async {
    try {
      final responce = await _signInApiService.signInWithEmailAndPassword(
        SignInQureys.signInQureys(signInRequestBody),
      );
      if (responce.data == null) {
        return const Left('Email Or Password Incorrect');
      } else {}
      return Right(responce);
    } catch (error, stack) {
      debugPrint('error: $error');
      debugPrint('Where: $stack');
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, RoleResponceModel>> getUserRole() async {
    try {
      final result = await _signInApiService.getUserRole();
      return Right(result);
    } catch (error, stack) {
      debugPrint('error: $error');
      debugPrint('Where: $stack');
      return Left(error.toString());
    }
  }
}
