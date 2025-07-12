import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_state.dart';
import 'package:sadio_mane_store/features/users/presentation/widgets/get_users_success_screen.dart';

class UsersViewTable extends StatelessWidget {
  const UsersViewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen: (previous, current) {
        return current is GetUsersSuccessState ||
            current is GetUsersLoadingState ||
            current is GetUsersErrorState ||
            current is DeleteUserByIdLoadingState;
      },
      builder: (context, state) {
        return switch (state) {
          GetUsersLoadingState() => _getUserLoadingScreen(),
          GetUsersSuccessState() => GetUsersSuccessScreen(
            usersList: state.users,
          ),
          GetUsersErrorState() => __getUsersFailureScreen(
            errorMessage: state.errorMessage,
          ),
          DeleteUserByIdLoadingState() => _getUserLoadingScreen(),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _getUserLoadingScreen() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget __getUsersFailureScreen({required String errorMessage}) {
    return Center(child: Text(errorMessage));
  }
}
