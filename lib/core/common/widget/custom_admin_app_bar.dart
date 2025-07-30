import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomAdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAdminAppBar({
    required this.backGroundColor,
    required this.title,
    required this.isMain,
    super.key,
  });
  final bool isMain;
  final Color backGroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: backGroundColor,
      centerTitle: true,
      title: Text(title),
      leading:
          isMain
              ? IconButton(
                onPressed: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                icon: const Icon(Icons.menu),
              )
              : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
