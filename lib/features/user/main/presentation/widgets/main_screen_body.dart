import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/main_screen_bottom_bar.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(context.theme.appImage.mainBackGround),
        ),
      ),
      child: const Column(
        children: [
          Expanded(child: Text('Choose your products')),
          MainScreenBottomBar(),
        ],
      ),
    );
  }
} 