import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/current_screen_display.dart';

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
      child: Column(
        children: [
          verticalSpace(20),
          const Expanded(child: CurrentDisplayScreen()),

          const MainScreenBottomBar(),
        ],
      ),
    );
  }
}
