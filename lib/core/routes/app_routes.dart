import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/app/upload_image/data/data_source/upload_image_api_servce.dart';
import 'package:sadio_mane_store/app/upload_image/data/data_source/upload_image_remote_data_source.dart';
import 'package:sadio_mane_store/app/upload_image/data/repository/upload_image_repository_implmentation.dart';
import 'package:sadio_mane_store/app/upload_image/logic/usecase/upload_image_usecase.dart';
import 'package:sadio_mane_store/core/common/image_picker.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/internet_connection/screen/no_internet_screen.dart';
import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/admin/admin_home_view.dart';
import 'package:sadio_mane_store/features/admin/customer_home_view.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/view/sign_in_view.dart';
import 'package:sadio_mane_store/features/sign_up/data/data_source/sign_up_api_service.dart';
import 'package:sadio_mane_store/features/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:sadio_mane_store/features/sign_up/data/repository/sign_up_repository_imple.dart';
import 'package:sadio_mane_store/features/sign_up/logic/usecase/sign_up_usecase.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/view/sign_up_view.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case RoutesString.noInternetConnectionScreen:
        return MaterialPageRoute(builder: (_) => const NoInternetScreen());
      case RoutesString.adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHomeView());
      case RoutesString.userHome:
        return MaterialPageRoute(builder: (_) => const CustomerHomeView());
      case RoutesString.signIn:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignInCubit>(),
                child: const SignInView(),
              ),
        );
      case RoutesString.signUp:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => SignUpCubit(
                          SignUpUsecase(
                            SignUpRepositoryImple(
                              SignUpRemoteDataSourceImpl(
                                SignUpApiService(DioFactory.getDio()),
                              ),
                            ),
                          ),
                        ),
                  ),
                  BlocProvider(
                    create:
                        (context) => UploadImageCubit(
                          UploadImageUsecase(
                            UploadImageRepositoryImplmentation(
                              UploadImageRemoteDataSource(
                                UploadImageApiServce(DioFactory.getDio()),
                              ),
                            ),
                          ),
                          ImagePickerClass(context: context),
                        ),
                  ),
                ],
                child: const SignUpView(),
              ),
        );

      default:
        return null;
    }
  }
}
