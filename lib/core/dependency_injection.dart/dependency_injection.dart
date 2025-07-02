import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/app/upload_image/data/data_source/upload_image_api_servce.dart';
import 'package:sadio_mane_store/app/upload_image/data/data_source/upload_image_remote_data_source.dart';
import 'package:sadio_mane_store/app/upload_image/data/repository/upload_image_repository_implmentation.dart';
import 'package:sadio_mane_store/app/upload_image/logic/repository/upload_image_repository.dart';
import 'package:sadio_mane_store/app/upload_image/logic/usecase/upload_image_usecase.dart';
import 'package:sadio_mane_store/core/common/image_picker.dart';

import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/features/categories/data/data_source/categories_api_service.dart';
import 'package:sadio_mane_store/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:sadio_mane_store/features/categories/data/repository/categories_repository.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/categories_repository.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/dashboard/data/data_source/dashboard_api_service.dart';
import 'package:sadio_mane_store/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:sadio_mane_store/features/dashboard/data/repository/dashboard_repository_implmentation.dart';
import 'package:sadio_mane_store/features/dashboard/logic/repository/dashboard_repository.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_categories_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_products_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_users_total_number_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/bloc/dashboard_bloc.dart';
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
  final navigatorKey = GlobalKey<NavigatorState>();
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
  _signIn(dio);
  _signUp(dio);
  _dashBoard(dio);
  _uploadImage(dio);
  _categories(dio);
  debugPrint('✅ GetIt setup done');
}

void _categories(Dio dio) {
  getIt
    ..registerLazySingleton<CategoriesApiService>(
      () => CategoriesApiService(dio),
    )
    ..registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<CategoriesRepository>(
      () => GetCategoriesRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<GetCategoriesUsecase>(
      () => GetCategoriesUsecase(getIt()),
    )
    ..registerLazySingleton<CategoriesBloc>(() => CategoriesBloc(getIt()));
}

void _uploadImage(Dio dio) {
  getIt
    ..registerLazySingleton(() => UploadImageApiServce(dio))
    ..registerLazySingleton(() => UploadImageRemoteDataSource(getIt()))
    ..registerLazySingleton<UploadImageRepository>(
      () => UploadImageRepositoryImplmentation(getIt()),
    )
    ..registerLazySingleton(() => UploadImageUsecase(getIt()))
    ..registerLazySingleton(
      () => UploadImageCubit(
        getIt(),
        ImagePickerClass(
          context: getIt<GlobalKey<NavigatorState>>().currentContext!,
        ),
      ),
    );
}

void _dashBoard(Dio dio) {
  getIt
    ..registerLazySingleton(() => DashboardApiService(dio))
    ..registerLazySingleton<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImplmentation(getIt()),
    )
    ..registerLazySingleton<GetProductsLengthUsecase>(
      () => GetProductsLengthUsecase(getIt()),
    )
    ..registerLazySingleton<GetUsersTotalNumberUseCase>(
      () => GetUsersTotalNumberUseCase(getIt()),
    )
    ..registerLazySingleton<GetCategoriesLengthUsecase>(
      () => GetCategoriesLengthUsecase(getIt()),
    )
    ..registerFactory<DashboardBloc>(
      () => DashboardBloc(getIt(), getIt(), getIt()),
    );
}

void _signUp(Dio dio) {
  getIt
    ..registerLazySingleton(() => SignUpApiService(dio))
    ..registerLazySingleton(() => SignUpRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImple(getIt()),
    )
    ..registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(getIt()))
    ..registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
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
