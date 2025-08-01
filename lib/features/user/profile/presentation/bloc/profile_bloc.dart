import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/profile/domain/usecases/get_profile_usecase.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_event.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getProfileUsecase) : super(ProfileLoadingState()) {
    on<GetProfileEvent>(_onGetProfileEvent);
  }
  final GetProfileUsecase _getProfileUsecase;
  Future<void> _onGetProfileEvent(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    try {
      final result = await _getProfileUsecase.call();
      result.fold(
        (error) => emit(ProfileErrorState(error)),
        (data) => emit(ProfileLoadedState(data)),
      );
    } on Exception catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }
}
