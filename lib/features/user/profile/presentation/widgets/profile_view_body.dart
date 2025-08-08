import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_bloc.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_state.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/states/profile_error_state.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/states/profile_loaded_state.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/states/profile_loading_state.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous is ProfileLoadingState ||
          previous is ProfileLoadedState ||
          previous is ProfileErrorState,
      builder: (context, state) {
        switch (state) {
          case ProfileLoadingState():
            return const ProfileLoadingWidget();
          case ProfileLoadedState():
            return ProfileLoadedWidget(userProfile: state.userProfile);
          case ProfileErrorState():
            return const ProfileErrorWidget();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
