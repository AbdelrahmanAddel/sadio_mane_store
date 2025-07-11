import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/users/data/model/get_users_responce_model.dart';
import 'package:sadio_mane_store/features/users/logic/repository/users_repository.dart';

class GetUsersUsecase {
  GetUsersUsecase(this._usersRepository);
  final UsersRepository _usersRepository;

  Future<Either<String, GetUsersResponceModel>> call() =>
      _usersRepository.getUsers();
}
