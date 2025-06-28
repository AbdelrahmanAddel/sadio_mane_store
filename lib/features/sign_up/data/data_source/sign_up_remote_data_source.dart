import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/sign_in/data/graphql/sign_up_qureys.dart';
import 'package:sadio_mane_store/features/sign_up/data/data_source/sign_up_api_service.dart';
import 'package:sadio_mane_store/features/sign_up/data/model/sign_up_request_model.dart';
import 'package:sadio_mane_store/features/sign_up/data/model/sign_up_responce_model.dart';

abstract class SignUpRemoteDataSource {
  Future<Either<String, SignUpResponceModel>> signUpWithEmailAndPassword({
    required SignUpRequestModel signRequestModel,
  });
}

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  SignUpRemoteDataSourceImpl(this._signUpApiService);
  final SignUpApiService _signUpApiService;

  @override
  Future<Either<String, SignUpResponceModel>> signUpWithEmailAndPassword({
    required SignUpRequestModel signRequestModel,
  }) async {
    try {
      final responce = await _signUpApiService.signUpWithEmailAndPassword(
        SignUpQureys.signUpQureys(signRequestModel: signRequestModel),
      );
      return Right(responce);
    } catch (error, stack) {
      debugPrint('error =>>> $error');
      debugPrint('Where =>>> $stack');

      return const Left('Something went wrong');
    }
  }
}
