import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_api_service.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:sadio_mane_store/features/sign_in/data/repository/sign_in_repository_implementation.dart';
import 'package:sadio_mane_store/features/sign_in/logic/repository/sign_in_repository.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/get_user_role_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/sign_in_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/sign_up/data/data_source/sign_up_api_service.dart';
import 'package:sadio_mane_store/features/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:sadio_mane_store/features/sign_up/data/repository/sign_up_repository_imple.dart';
import 'package:sadio_mane_store/features/sign_up/logic/repository/sign_up_repository.dart';
import 'package:sadio_mane_store/features/sign_up/logic/usecase/sign_up_usecase.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/cubit/sign_up_cubit.dart';

final GetIt getIt = GetIt.instance;
void setUpGetIt() {
  final dio = DioFactory.getDio();

  _signIn(dio);
  _signUp(dio);
  print("✅ GetIt setup done");
}

void _signUp(Dio dio) {
  getIt
    ..registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio))
    ..registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImple(getIt()),
    )
    ..registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(getIt()))
    ..registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));
}

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
