import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/internet_connection/screen/no_internet_screen.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/admin/admin_home_view.dart';
import 'package:sadio_mane_store/features/admin/customer_home_view.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/view/categories_view.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:sadio_mane_store/features/products/presentation/view/products_view.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/view/sign_in_view.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/view/sign_up_view.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case RoutesString.noInternetConnectionScreen:
        return MaterialPageRoute(builder: (_) => const NoInternetScreen());
      case RoutesString.adminHome:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<DashboardBloc>()..add(GetAllDashboardDataEvent()),
                child: const AdminHomeView(),
              ),
        );
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
                  BlocProvider(create: (context) => getIt<SignUpCubit>()),
                  BlocProvider(create: (context) => getIt<UploadImageCubit>()),
                ],
                child: const SignUpView(),
              ),
        );
      case RoutesString.categories:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
                child: const CategoriesView(),
              ),
        );
      case RoutesString.products:
        return MaterialPageRoute(builder: (_) => const ProductsView());

      default:
        return null;
    }
  }
}
