import 'package:sadio_mane_store/features/users/data/model/get_users_responce_model.dart';

sealed class UsersState {}

final class GetUsersLoadingState extends UsersState {}

final class GetUsersSuccessState extends UsersState {
  GetUsersSuccessState({required this.users});
  final List<UsersDataModel> users;
}

final class GetUsersErrorState extends UsersState {
  GetUsersErrorState({required this.message});
  final String message;
}
