import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/main/enum/main_view_enums.dart';
import 'package:sadio_mane_store/features/user/main/presentation/cubit/main_cubit.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/main_screen_body.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/main_view_app_bar.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final cubit = context.read<MainCubit>();
    return Scaffold(
      backgroundColor: theme.appColors.mainColor,
      appBar: cubit.mainViewEnums == MainViewEnums.home
          ? mainScreenAppBar(context)
          : null,
      body: const MainScreenBody(),
    );
  }
}
