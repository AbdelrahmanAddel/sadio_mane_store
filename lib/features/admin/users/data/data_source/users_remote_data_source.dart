import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:sadio_mane_store/features/admin/users/data/data_source/users_api_service.dart';
import 'package:sadio_mane_store/features/admin/users/data/graphql/users_graphql.dart';
import 'package:sadio_mane_store/features/admin/users/data/model/get_users_responce_model.dart';

class UsersRemoteDataSource {
  UsersRemoteDataSource(this._usersApiService);
  final UsersApiService _usersApiService;

  Future<Either<String, GetUsersResponceModel>> getUsers() async {
    try {
      final users = await _usersApiService.getUsers(UsersGraphql.getUsers());
      return Right(users);
    } catch (error, stackTrace) {
      debugPrint('error => $error');
      debugPrint('stackTrace => $stackTrace');
      return Left(error.toString());
    }
  }

  Future<Either<String, String>> deleteUserById(int id) async {
    try {
      await _usersApiService.deleteUserById(
        UsersGraphql.deleteUserById(userId: id),
      );
      return const Right('Deleted Successfully !');
    } catch (error, stackTrace) {
      debugPrint('error => $error');
      debugPrint('stackTrace => $stackTrace');
      return Left(error.toString());
    }
  }
}
