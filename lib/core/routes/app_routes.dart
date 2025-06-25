import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/sadio_mane_app.dart';
import 'package:sadio_mane_store/core/internet_connection/screen/no_internet_screen.dart';
import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_api_service.dart';
import 'package:sadio_mane_store/features/sign_in/data/data_source/sign_in_remote_data_source.dart.dart';
import 'package:sadio_mane_store/features/sign_in/data/repository/sign_in_repository_implementation.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/sign_in_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/view/sign_in_view.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/view/sign_up_view.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case RoutesString.noInternetConnectionScreen:
        return MaterialPageRoute(builder: (_) => const NoInternetScreen());
      case RoutesString.homeScreen:
        return MaterialPageRoute(builder: (_) => const SadioManeApp());
      case RoutesString.signIn:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => SignInCubit(
                      SignInUsecase(
                        signInRepository: SignInRepositoryImplementation(
                          signInRemoteDataSource:
                              SignInRemoteDataSourceImplemtation(
                                signInApiService: SignInApiService(
                                  DioFactory.getDio(),
                                ),
                              ),
                        ),
                      ),
                    ),
                child: const SignInView(),
              ),
        );
      case RoutesString.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      default:
        return null;
    }
  }
}
