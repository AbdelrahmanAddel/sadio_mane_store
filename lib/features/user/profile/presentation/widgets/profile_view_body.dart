import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_bloc.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_state.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_feature_item.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_header.dart';

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
            return const Center(child: CircularProgressIndicator());
          case ProfileLoadedState():
            return _profileLoadedScreen(state.userProfile, context);
          case ProfileErrorState():
            return const Center(child: Text('Error'));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _profileLoadedScreen(UserProfileModel state, BuildContext context) {
    return Column(
      children: [
        verticalSpace(70),
        ProfileHeader(userProfileData: state),
        verticalSpace(20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.tr.application_features,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
          ),
        ),
        verticalSpace(25),
        const ProfileFeatureItem(),
      ],
    );
  }
}
