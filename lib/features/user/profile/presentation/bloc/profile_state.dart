import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  ProfileLoadedState(this.userProfile);
  final UserProfileModel userProfile;
}

final class ProfileErrorState extends ProfileState {
  ProfileErrorState(this.error);
  final String error;
}
