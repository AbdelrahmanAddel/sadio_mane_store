import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/profile/data/datasources/get_user_profile_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';
import 'package:sadio_mane_store/features/user/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(this._getProfileRemoteDataSource);

  final GetUserProfileRemoteDataSource _getProfileRemoteDataSource;
  @override
  Future<Either<String, UserProfileModel>> getUserProfile() async =>
      _getProfileRemoteDataSource.getUserProfile();
}
