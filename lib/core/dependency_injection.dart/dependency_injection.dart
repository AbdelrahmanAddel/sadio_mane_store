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
import 'package:sadio_mane_store/features/categories/logic/usecase/add_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/delete_category_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/updata_category_usecase.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/dashboard/data/data_source/dashboard_api_service.dart';
import 'package:sadio_mane_store/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:sadio_mane_store/features/dashboard/data/repository/dashboard_repository_implmentation.dart';
import 'package:sadio_mane_store/features/dashboard/logic/repository/dashboard_repository.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_categories_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_products_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_users_total_number_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:sadio_mane_store/features/products/data/data_source/product_api_service.dart';
import 'package:sadio_mane_store/features/products/data/data_source/products_remote_data_source.dart';
import 'package:sadio_mane_store/features/products/data/repository/product_repository_implmentation.dart';
import 'package:sadio_mane_store/features/products/logic/repository/product_repository.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/add_product_usecase.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/delete_product_usecase.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/get_product_usecase.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/update_product_usecase.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_bloc.dart';
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
import 'package:sadio_mane_store/features/users/data/data_source/users_api_service.dart';
import 'package:sadio_mane_store/features/users/data/data_source/users_remote_data_source.dart';
import 'package:sadio_mane_store/features/users/data/repository/users_repository_implmentation.dart';
import 'package:sadio_mane_store/features/users/logic/repository/users_repository.dart';
import 'package:sadio_mane_store/features/users/logic/usecase/delete_users_usecase.dart';
import 'package:sadio_mane_store/features/users/logic/usecase/get_users_usecase.dart';
import 'package:sadio_mane_store/features/users/presentation/bloc/users_bloc.dart';

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
  debugPrint('✅ GetIt setup done');
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
    ..registerFactory(() => UsersBloc(getIt()));
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
