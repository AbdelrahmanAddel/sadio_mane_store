import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/user/main/enum/main_view_enums.dart';
import 'package:sadio_mane_store/features/user/main/presentation/cubit/main_cubit.dart';
import 'package:sadio_mane_store/features/user/main/presentation/cubit/main_state.dart';
import 'package:sadio_mane_store/features/user/main/presentation/widgets/icon_tab_nav_bar.dart';

class BottomBarIcons extends StatelessWidget {
  const BottomBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) => current is ChangeMainViewState,
      builder: (context, state) {
        return Container(
          color: context.theme.appColors.navBarbg,
          height: 88.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTapNavBar(
                  onTap: () {
                    mainCubit.changeMainView(MainViewEnums.home);
                  },
                  icon: Assets.assetsImagesSvgHomeTabIcon,
                  isSelected: state.mainViewEnums == MainViewEnums.home,
                ),
                IconTapNavBar(
                  onTap: () {
                    mainCubit.changeMainView(MainViewEnums.home);
                  },
                  icon: Assets.assetsImagesSvgHomeTabIcon,
                  isSelected: state.mainViewEnums == MainViewEnums.home,
                ),
                IconTapNavBar(
                  onTap: () {
                    mainCubit.changeMainView(MainViewEnums.categories);
                  },
                  icon: Assets.assetsImagesSvgCategoriesTapIcon,
                  isSelected: state.mainViewEnums == MainViewEnums.categories,
                ),
                IconTapNavBar(
                  onTap: () {
                    mainCubit.changeMainView(MainViewEnums.favorite);
                  },
                  icon: Assets.assetsImagesSvgFavoriteTabIcon,
                  isSelected: state.mainViewEnums == MainViewEnums.favorite,
                ),
                IconTapNavBar(
                  onTap: () {
                    mainCubit.changeMainView(MainViewEnums.profile);
                  },
                  icon: Assets.assetsImagesSvgProfileTabIcon,
                  isSelected: state.mainViewEnums == MainViewEnums.profile,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
