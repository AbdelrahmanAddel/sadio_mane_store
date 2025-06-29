import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_admin_app_bar.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/drawer_items.dart';

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({super.key, this.onTap});

  final void Function(Widget)? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.bluePinkDark,
      appBar: CustomAdminAppBar(
        backGrounfColor: context.theme.appColors.bluePinkDark,
        title: 'Sadio Store',

        isMain: false,
      ),
      body: Column(
        children: [
          Column(
            children:
                drawerItem(context)
                    .map(
                      (e) => ListTile(
                        onTap: () => onTap!(e.page),

                        title: e.title,
                        leading: e.icon,
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
