import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/users/logic/repository/users_repository.dart';

class DeleteUsersUsecase {
  DeleteUsersUsecase(this._usersRepository);
  final UsersRepository _usersRepository;

  Future<Either<String, String>> call(int id) =>
      _usersRepository.deleteUserById(id);
}
