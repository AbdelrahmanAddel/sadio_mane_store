import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/view/home_page.dart';
import 'package:sadio_mane_store/features/user/categories/presentation/view/categories_view.dart';
import 'package:sadio_mane_store/features/user/favorite/presentation/view/favorite_view.dart';
import 'package:sadio_mane_store/features/user/main/enum/main_view_enums.dart';
import 'package:sadio_mane_store/features/user/main/presentation/cubit/main_cubit.dart';
import 'package:sadio_mane_store/features/user/main/presentation/cubit/main_state.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/view/profile_view.dart';
import 'package:sadio_mane_store/test_screen.dart';

class CurrentDisplayScreen extends StatelessWidget {
  const CurrentDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) => current is ChangeMainViewState,
      builder: (context, state) {
        switch (state.mainViewEnums) {
          case MainViewEnums.home:
            return const HomeView();
          case MainViewEnums.categories:
            return const UserCategoriesView();
          case MainViewEnums.favorite:
            return const FavoriteView();
          case MainViewEnums.cart:
            return const MyTestScreen();
          case MainViewEnums.profile:
            return const ProfileView();
        }
      },
    );
  }
}
