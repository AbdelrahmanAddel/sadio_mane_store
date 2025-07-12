import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_event.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_state.dart';

// ignore: must_be_immutable
class UsersViewTextFormField extends StatelessWidget {
  UsersViewTextFormField({required this.userBloc, super.key});

  final UsersBloc userBloc;
  String value = '';
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
                this.value = value;
                debugPrint(this.value);
                userBloc.add(SearchForUser(value, state.users));
              },
              controller: userBloc.searchController,

              hintText: 'Search For User',
            );
          case SearchForUserSuccessState():
            return CustomTextFormField(
              onChanged: (value) {
                this.value = value;
                debugPrint(this.value);
                userBloc.add(SearchForUser(value, state.users));
              },
              controller: userBloc.searchController,
              suffixIcon:
                  value.isEmpty || value == ''
                      ? const SizedBox.shrink()
                      : IconButton(
                        onPressed: () {
                          userBloc.searchController.clear();
                          userBloc.add(GetUsersEvent());
                        },
                        icon: const Icon(Icons.clear),
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
