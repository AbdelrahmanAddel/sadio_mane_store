import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/users/data/model/get_users_responce_model.dart';

abstract class UsersRepository {
  Future<Either<String, GetUsersResponceModel>> getUsers();
  Future<Either<String, String>> deleteUserById(int id);
}
