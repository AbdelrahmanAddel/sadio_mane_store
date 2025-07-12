abstract class UsersEvent {}

final class GetUsersEvent extends UsersEvent {}

final class DeleteUserByIdEvent extends UsersEvent {
  DeleteUserByIdEvent(this.userId);
  final int userId;
}
