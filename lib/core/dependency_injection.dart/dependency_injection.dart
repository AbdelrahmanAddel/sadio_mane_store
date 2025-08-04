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
import 'package:sadio_mane_store/features/admin/categories/data/data_source/categories_api_service.dart';
import 'package:sadio_mane_store/features/admin/categories/data/data_source/categories_remote_data_source.dart';
import 'package:sadio_mane_store/features/admin/categories/data/repository/categories_repository.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/repository/categories_repository.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/usecase/add_categories_usecase.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/usecase/delete_category_usecase.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/usecase/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/admin/categories/logic/usecase/updata_category_usecase.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/data_source/dashboard_api_service.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/repository/dashboard_repository_implmentation.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/repository/dashboard_repository.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/usecase/get_categories_length_usecase.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/usecase/get_products_length_usecase.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/usecase/get_users_total_number_usecase.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:sadio_mane_store/features/admin/notification/presentation/bloc/notification_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/data/data_source/product_api_service.dart';
import 'package:sadio_mane_store/features/admin/products/data/data_source/products_remote_data_source.dart';
import 'package:sadio_mane_store/features/admin/products/data/repository/product_repository_implmentation.dart';
import 'package:sadio_mane_store/features/admin/products/logic/repository/product_repository.dart';
import 'package:sadio_mane_store/features/admin/products/logic/usecase/add_product_usecase.dart';
import 'package:sadio_mane_store/features/admin/products/logic/usecase/delete_product_usecase.dart';
import 'package:sadio_mane_store/features/admin/products/logic/usecase/get_product_usecase.dart';
import 'package:sadio_mane_store/features/admin/products/logic/usecase/update_product_usecase.dart';
import 'package:sadio_mane_store/features/admin/products/presentation/bloc/product_bloc.dart';
import 'package:sadio_mane_store/features/admin/users/data/data_source/users_api_service.dart';
import 'package:sadio_mane_store/features/admin/users/data/data_source/users_remote_data_source.dart';
import 'package:sadio_mane_store/features/admin/users/data/repository/users_repository_implmentation.dart';
import 'package:sadio_mane_store/features/admin/users/logic/repository/users_repository.dart';
import 'package:sadio_mane_store/features/admin/users/logic/usecase/delete_users_usecase.dart';
import 'package:sadio_mane_store/features/admin/users/logic/usecase/get_users_usecase.dart';
import 'package:sadio_mane_store/features/admin/users/presentation/bloc/users_bloc.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/data_source/sign_in_api_service.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/data/repository/sign_in_repository_implementation.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/logic/repository/sign_in_repository.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/logic/usecases/get_user_role_usecase.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/logic/usecases/sign_in_usecase.dart';
import 'package:sadio_mane_store/features/authentication/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/data_source/sign_up_api_service.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/repository/sign_up_repository_imple.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/logic/repository/sign_up_repository.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/logic/usecase/sign_up_usecase.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:sadio_mane_store/features/user/home/data/datasources/home_api_service.dart';
import 'package:sadio_mane_store/features/user/home/data/datasources/home_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/home/data/repositories/home_repository_impl.dart';
import 'package:sadio_mane_store/features/user/home/domain/repositories/home_repositry.dart';
import 'package:sadio_mane_store/features/user/home/domain/usecases/get_banners_usecase.dart';
import 'package:sadio_mane_store/features/user/home/domain/usecases/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/profile/data/datasources/get_user_profile_api_service.dart';
import 'package:sadio_mane_store/features/user/profile/data/datasources/get_user_profile_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/profile/data/repositories/profile_repository_impl.dart';
import 'package:sadio_mane_store/features/user/profile/domain/repositories/profile_repository.dart';
import 'package:sadio_mane_store/features/user/profile/domain/usecases/get_profile_usecase.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_bloc.dart';

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
  _products(dio);
  _users(dio);
  _notification();
  _profile(dio);
  _home(dio);
  debugPrint('✅ GetIt setup done');
}

void _notification() {
  getIt.registerFactory(NotificationBloc.new);
}

void _users(Dio dio) {
  getIt
    ..registerLazySingleton(() => UsersApiService(dio))
    ..registerLazySingleton(() => UsersRemoteDataSource(getIt()))
    ..registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImplmentation(getIt()),
    )
    ..registerLazySingleton(() => GetUsersUsecase(getIt()))
    ..registerLazySingleton(() => DeleteUsersUsecase(getIt()))
    ..registerFactory(() => UsersBloc(getIt(), getIt()));
}

void _products(Dio dio) {
  getIt
    ..registerLazySingleton(() => ProductApiService(dio))
    ..registerLazySingleton(() => ProductsRemoteDataSource(getIt()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImplmentation(getIt()),
    )
    ..registerLazySingleton(() => GetProductUsecase(getIt()))
    ..registerLazySingleton(() => AddProductUsecase(getIt()))
    ..registerLazySingleton(() => DeleteProductUsecase(getIt()))
    ..registerLazySingleton(() => UpdateProductUsecase(getIt()))
    ..registerFactory(() => ProductBloc(getIt(), getIt(), getIt(), getIt()));
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
    ..registerLazySingleton<AddCategoriesUsecase>(
      () => AddCategoriesUsecase(getIt()),
    )
    ..registerLazySingleton(() => DeleteCategoryUsecase(getIt()))
    ..registerLazySingleton(() => UpdataCategoryUsecase(getIt()))
    ..registerFactory<CategoriesBloc>(
      () => CategoriesBloc(getIt(), getIt(), getIt(), getIt()),
    );
}

void _uploadImage(Dio dio) {
  getIt
    ..registerLazySingleton(() => UploadImageApiServce(dio))
    ..registerLazySingleton(() => UploadImageRemoteDataSource(getIt()))
    ..registerLazySingleton<UploadImageRepository>(
      () => UploadImageRepositoryImplmentation(getIt()),
    )
    ..registerLazySingleton(() => UploadImageUsecase(getIt()))
    ..registerFactory(
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

void _profile(Dio dio) {
  getIt
    ..registerLazySingleton(() => GetUserProfileApiService(dio))
    ..registerLazySingleton(() => GetUserProfileRemoteDataSource(getIt()))
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(getIt()),
    )
    ..registerLazySingleton(() => GetProfileUsecase(getIt()))
    ..registerFactory(() => ProfileBloc(getIt()));
}

void _home(Dio dio) {
  getIt
    ..registerLazySingleton(() => HomeApiService(dio))
    ..registerLazySingleton(() => HomeRemoteDataSource(getIt()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()))
    ..registerLazySingleton(() => GetBannersUsecase(getIt()))
    ..registerLazySingleton(() => GetHomeCategoriesUsecase(getIt()))
    ..registerFactory(() => HomeBloc(
          getBannersUsecase: getIt(),
          getCategoriesUsecase: getIt(),
        ));
}
