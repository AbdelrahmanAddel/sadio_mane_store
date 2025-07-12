import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_state.dart';

class UsersBolcListener extends StatelessWidget {
  const UsersBolcListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listenWhen: (previous, current) {
        switch (current) {
          case GetUsersErrorState():
          case DeleteUserByIdSuccessState():
          case DeleteUserByIdErrorState():
          case SearchForUserErrorState():
            return true;
          default:
            return false;
        }
      },
      listener: (context, state) {
        switch (state) {
          case GetUsersErrorState():
            customFlutterToast(message: state.errorMessage);
          case DeleteUserByIdSuccessState():
            customFlutterToast(
              message: state.successMessage,
              backgroundColor: Colors.green,
            );

          case DeleteUserByIdErrorState():
            customFlutterToast(
              message: state.errorMessage,
              backgroundColor: Colors.green,
            );

          case SearchForUserErrorState():
            customFlutterToast(message: state.errorMessage);
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
