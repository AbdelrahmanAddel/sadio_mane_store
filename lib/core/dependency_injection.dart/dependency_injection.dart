
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
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
  final dio2 = Dio().options.headers.addAll({
    'Authorization':
        'Bearer ${SharedPrefHelper.getString(SharedPrefKey.accessToken)}'
  }
  );
  getIt..registerFactory<SignInApiService>(() => SignInApiService(dio))
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

  // getIt.registerLazySingleton<SignInUsecase>(() => SignInUsecase(getIt()));
}
