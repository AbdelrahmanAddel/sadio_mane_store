import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';
import 'package:sadio_mane_store/features/user/profile/domain/repositories/profile_repository.dart';

class GetProfileUsecase {
  GetProfileUsecase(this._profileRepository);

  final ProfileRepository _profileRepository;

  Future<Either<String, UserProfileModel>> call() async =>
      _profileRepository.getUserProfile();
}
