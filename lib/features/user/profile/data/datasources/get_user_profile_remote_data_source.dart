import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/profile/data/datasources/get_user_profile_api_service.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';

class GetUserProfileRemoteDataSource {
  GetUserProfileRemoteDataSource(this._getUserProfileRemoteDataSource);

  final GetUserProfileApiService _getUserProfileRemoteDataSource;
  Future<Either<String, UserProfileModel>> getUserProfile() async {
    try {
      return Right(await _getUserProfileRemoteDataSource.getUserProfile());
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
