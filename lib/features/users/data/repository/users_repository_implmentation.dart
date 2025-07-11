import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/users/data/data_source/users_remote_data_source.dart';
import 'package:sadio_mane_store/features/users/data/model/get_users_responce_model.dart';
import 'package:sadio_mane_store/features/users/logic/repository/users_repository.dart';

class UsersRepositoryImplmentation extends UsersRepository {
  UsersRepositoryImplmentation(this._usersRemoteDataSource);
  final UsersRemoteDataSource _usersRemoteDataSource;

  @override
  Future<Either<String, GetUsersResponceModel>> getUsers() =>
      _usersRemoteDataSource.getUsers();

  @override
  Future<Either<String, String>> deleteUserById(int id) =>
      _usersRemoteDataSource.deleteUserById(id);
}
