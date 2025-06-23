import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/internet_connection/screen/no_internet_screen.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/view/sign_in_view.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/view/sign_up_view.dart';
import 'package:sadio_mane_store/sadio_mane_app.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case RoutesString.noInternetConnectionScreen:
        return MaterialPageRoute(builder: (_) => const NoInternetScreen());
      case RoutesString.homeScreen:
        return MaterialPageRoute(builder: (_) => const SadioManeApp());
      case RoutesString.signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case RoutesString.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());


      default:
        return null;
    }
  }
}
