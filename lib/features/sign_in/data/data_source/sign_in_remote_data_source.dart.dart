import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_api_service.dart';
import 'package:sadio_mane_store/features/sign_in/data/graphql/sign_in_qureys.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_responce_model.dart';

abstract class SignInRemoteDataSource {
  Future<Either<String, SignInResponceModel>> signInWithEmailAndPassword({
    required SignInRequestBody signInRequestBody,
  });
}

class SignInRemoteDataSourceImplemtation extends SignInRemoteDataSource {
  SignInRemoteDataSourceImplemtation({required this.signInApiService});
  SignInApiService signInApiService;
  @override
  Future<Either<String, SignInResponceModel>> signInWithEmailAndPassword({
    required SignInRequestBody signInRequestBody,
  }) async {
    try {
      final responce = await signInApiService.signInWithEmailAndPassword(
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
}
