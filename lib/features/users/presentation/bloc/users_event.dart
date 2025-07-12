import 'package:sadio_mane_store/features/users/data/model/get_users_responce_model.dart';

abstract class UsersEvent {}

final class GetUsersEvent extends UsersEvent {}

final class DeleteUserByIdEvent extends UsersEvent {
  DeleteUserByIdEvent(this.userId);
  final int userId;
}

final class SearchForUser extends UsersEvent {
  SearchForUser(this.search, this.users);
  final String? search;
  final List<UsersDataModel> users;
}
