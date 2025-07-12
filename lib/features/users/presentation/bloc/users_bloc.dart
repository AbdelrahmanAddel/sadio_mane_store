import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/users/logic/usecase/delete_users_usecase.dart';
import 'package:sadio_mane_store/features/users/logic/usecase/get_users_usecase.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this._getUsersUsecase, this._deleteUsersUsecase)
    : super(GetUsersLoadingState()) {
    on<GetUsersEvent>(_getUsers);
    on<DeleteUserByIdEvent>(_deleteUserById);
  }
  final GetUsersUsecase _getUsersUsecase;
  final DeleteUsersUsecase _deleteUsersUsecase;

  FutureOr<void> _getUsers(
    GetUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(GetUsersLoadingState());
    final responce = await _getUsersUsecase.call();
    if (isClosed) return;
    responce.fold(
      (errorMessage) {
        emit(GetUsersErrorState(errorMessage: errorMessage));
      },
      (users) {
        emit(GetUsersSuccessState(users: users.data!.users));
      },
    );
  }

  FutureOr<void> _deleteUserById(
    DeleteUserByIdEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(DeleteUserByIdLoadingState());
    final responce = await _deleteUsersUsecase.call(event.userId);
    responce.fold(
      (errorMessage) {
        emit(DeleteUserByIdErrorState(errorMessage: errorMessage));
      },
      (successMessage) {
        emit(DeleteUserByIdSuccessState(successMessage: successMessage));
        add(GetUsersEvent());
      },
    );
  }
}
