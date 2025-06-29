import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sadio_mane_store/core/common/widget/custom_menu_admin_screen.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/view/dashboard_view.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  Widget currentScreen = const DashBoardView();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder:
            (context) => MenuAdminScreen(
              onTap: (screen) {
                setState(() {
                  currentScreen = screen;
                });
                ZoomDrawer.of(context)!.close();
              },
            ),
      ),
      mainScreen: currentScreen,
      borderRadius: 30,
      showShadow: true,
      drawerShadowsBackgroundColor: context.theme.appColors.mainColor,
      menuBackgroundColor: context.theme.appColors.bluePinkDark,
    );
  }
}
