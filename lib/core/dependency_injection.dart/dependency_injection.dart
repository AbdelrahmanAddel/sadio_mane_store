import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_api_service.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_remote_data_source.dart.dart';
import 'package:sadio_mane_store/features/sign_in/data/repository/sign_in_repository_implementation.dart';
import 'package:sadio_mane_store/features/sign_in/logic/repository/sign_in_repository.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/get_user_role_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/sign_in_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_cubit.dart';

final GetIt getIt = GetIt.instance;
void setUpGetIt() {
  final dio = DioFactory.getDio();

  _signIn(dio);
  // _uploadImage(dio);
}

// void _uploadImage(Dio dio) {
//   getIt..registerLazySingleton<UploadImageApiServce>(()=>UploadImageApiServce(dio))
//   ..registerLazySingleton<UploadImageRemoteDataSource>(()=>UploadImageRemoteDataSource(getIt()))
//   ..registerLazySingleton<UploadImageRepository>(()=>UploadImageRepositoryImplmentation(getIt()))
//   ..registerLazySingleton<UploadImageUsecase>(()=>UploadImageUsecase(getIt()))
//   ..registerFactory(()=>UploadImageCubit(getIt(),ImagePickerClass(context: context)));
// }







void _signIn(Dio dio) {
  getIt
    ..registerFactory<SignInApiService>(() => SignInApiService(dio))
    ..registerLazySingleton<SignInRemoteDataSource>(
      () => SignInRemoteDataSourceImplemtation(getIt()),
    )
    ..registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImplementation(signInRemoteDataSource: getIt()),
    )
    ..registerLazySingleton<GetUserRoleUseCase>(
      () => GetUserRoleUseCase(getIt()),
    )
    ..registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(signInRepository: getIt()),
    )
    ..registerFactory<SignInCubit>(() => SignInCubit(getIt(), getIt()));
}
