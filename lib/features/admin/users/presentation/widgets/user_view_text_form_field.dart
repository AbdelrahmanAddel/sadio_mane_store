import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_state.dart';

class UsersViewTextFormField extends StatelessWidget {
  const UsersViewTextFormField({required this.userBloc, super.key});

  final UsersBloc userBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen:
          (previous, current) =>
              current is GetUsersSuccessState ||
              current is GetUsersErrorState ||
              current is SearchForUserSuccessState,
      builder: (context, state) {
        switch (state) {
          case GetUsersSuccessState():
            return CustomTextFormField(
              onChanged: (value) {
                userBloc.add(SearchForUser(value, state.users));
              },
              controller: userBloc.searchController,

              hintText: 'Search For User',
            );
          case SearchForUserSuccessState():
            return CustomTextFormField(
              onChanged: (value) {
                userBloc.add(SearchForUser(value, state.users));
              },
              controller: userBloc.searchController,
              suffixIcon: IconButton(
                onPressed: () {
                  userBloc.searchController.clear();
                  userBloc.add(GetUsersEvent());
                },
                icon:
                    userBloc.searchController.text.isEmpty
                        ? const SizedBox.shrink()
                        : const Icon(Icons.remove),
              ),

              hintText: 'Search For User',
            );
          case GetUsersErrorState():
            return const CustomTextFormField(
              readOnly: true,

              hintText: "Something Went Wrong ,We Can't Search Now",
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
