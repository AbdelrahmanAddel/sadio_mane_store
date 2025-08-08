import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';

abstract class ProfileRepository {
  Future<Either<String, UserProfileModel>> getUserProfile();
}
