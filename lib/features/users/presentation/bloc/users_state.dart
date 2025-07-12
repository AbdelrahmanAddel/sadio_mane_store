import 'package:sadio_mane_store/features/users/data/model/get_users_responce_model.dart';

sealed class UsersState {}

final class GetUsersLoadingState extends UsersState {}

final class GetUsersSuccessState extends UsersState {
  GetUsersSuccessState({required this.users});
  final List<UsersDataModel> users;
}

final class GetUsersErrorState extends UsersState {
  GetUsersErrorState({required this.errorMessage});
  final String errorMessage;
}

final class DeleteUserByIdLoadingState extends UsersState {}

final class DeleteUserByIdSuccessState extends UsersState {
  DeleteUserByIdSuccessState({required this.successMessage});
  final String successMessage;
}

final class DeleteUserByIdErrorState extends UsersState {
  DeleteUserByIdErrorState({required this.errorMessage});
  final String errorMessage;
}
