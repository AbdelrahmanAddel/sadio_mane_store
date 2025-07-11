import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/users/logic/usecase/get_users_usecase.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this._getUsersUsecase) : super(GetUsersLoadingState()) {
    on<GetUsersEvent>(_getUsers);
  }
  final GetUsersUsecase _getUsersUsecase;

  FutureOr<void> _getUsers(
    GetUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(GetUsersLoadingState());
    final responce = await _getUsersUsecase.call();
    if (isClosed) return;
    responce.fold(
      (errorMessage) {
        emit(GetUsersErrorState(message: errorMessage));
      },
      (users) {
        emit(GetUsersSuccessState(users: users.data!.users));
      },
    );
  }
}
