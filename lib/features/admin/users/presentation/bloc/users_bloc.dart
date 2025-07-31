import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/admin/users/data/model/get_users_responce_model.dart';
import 'package:sadio_mane_store/features/admin/users/logic/usecase/delete_users_usecase.dart';
import 'package:sadio_mane_store/features/admin/users/logic/usecase/get_users_usecase.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this._getUsersUsecase, this._deleteUsersUsecase)
    : super(GetUsersLoadingState()) {
    on<GetUsersEvent>(_getUsers);
    on<DeleteUserByIdEvent>(_deleteUserById);
    on<SearchForUser>(_searchForUser);
  }
  final GetUsersUsecase _getUsersUsecase;
  final DeleteUsersUsecase _deleteUsersUsecase;
  TextEditingController searchController = TextEditingController();
  List<UsersDataModel> usersList = [];

  FutureOr<void> _getUsers(
    GetUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(GetUsersLoadingState());
    final responce = await _getUsersUsecase.call();
    if (isClosed) return;
    responce.fold(
      (errorMessage) {
        emit(
          GetUsersErrorState(
            errorMessage: "We Can't Get Users Now , Please Try Again Later ",
          ),
        );
      },
      (users) {
        usersList = users.data!.usersList;
        emit(GetUsersSuccessState(users: users.data!.usersList));
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

  FutureOr<void> _searchForUser(SearchForUser event, Emitter<UsersState> emit) {
    try {
      final usersSearchList = usersList
          .where(
            (users) =>
                users.name.toLowerCase().startsWith(
                  event.search?.toLowerCase() ?? '',
                ) ||
                users.email.toLowerCase().startsWith(
                  event.search?.toLowerCase() ?? '',
                ),
          )
          .toList();
      emit(SearchForUserSuccessState(users: usersSearchList));
      debugPrint(usersSearchList.toString());
    } catch (error) {
      emit(SearchForUserErrorState(errorMessage: error.toString()));
    }
  }
}
