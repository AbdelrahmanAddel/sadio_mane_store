import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/admin/customer_home_view.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:sadio_mane_store/second_screen.dart';

List<DrawerItemModel> drawerItem(BuildContext context) {
  return <DrawerItemModel>[
    DrawerItemModel(
      icon: Icon(Icons.dashboard, color: context.theme.appColors.textColor),
      title: Text(
        'DashBoard',
        style: context.theme.textTheme.displaySmall!.copyWith(
          color: context.theme.appColors.textColor,
          fontSize: 17.sp,
        ),
      ),
      page: const DashBoardView(),
    ),
    //Categories
    DrawerItemModel(
      icon: Icon(
        Icons.category_outlined,
        color: context.theme.appColors.textColor,
      ),
      title: Text(
        'categories',
        style: context.theme.textTheme.displaySmall!.copyWith(
          color: context.theme.appColors.textColor,
          fontSize: 17.sp,
        ),
      ),
      page: const SecondScreen(),
    ),
    //Product
    DrawerItemModel(
      icon: Icon(
        Icons.production_quantity_limits,
        color: context.theme.appColors.textColor,
      ),
      title: Text(
        'Product',
        style: context.theme.textTheme.displaySmall!.copyWith(
          color: context.theme.appColors.textColor,
          fontSize: 17.sp,
        ),
      ),
      page: const CustomerHomeView(),
    ),
    //Users
    DrawerItemModel(
      icon: Icon(
        Icons.people_alt_rounded,
        color: context.theme.appColors.textColor,
      ),
      title: Text(
        'users',
        style: context.theme.textTheme.displaySmall!.copyWith(
          color: context.theme.appColors.textColor,
          fontSize: 17.sp,
        ),
      ),
      page: const CustomerHomeView(),
    ),
    //Notifications
    DrawerItemModel(
      icon: Icon(
        Icons.notifications_active,
        color: context.theme.appColors.textColor,
      ),
      title: Text(
        'Notifications',
        style: context.theme.textTheme.displaySmall!.copyWith(
          color: context.theme.appColors.textColor,
          fontSize: 17.sp,
        ),
      ),
      page: const CustomerHomeView(),
    ),
    DrawerItemModel(
      icon: GestureDetector(
        onTap: () {
          // ignore: inference_failure_on_function_invocation
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Are you sure you want to logout? ',
                  style: context.theme.textTheme.displaySmall,
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red,
                        ),
                      ),

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'No',
                        style: context.theme.textTheme.displaySmall!.copyWith(
                          color: context.theme.appColors.textColor,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green,
                        ),
                      ),

                      onPressed: () {
                        context.pushReplacement(routeName: RoutesString.signIn);
                      },
                      child: Text(
                        'Yes',
                        style: context.theme.textTheme.displaySmall!.copyWith(
                          color: context.theme.appColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          SharedPrefHelper.removeData(SharedPrefKey.accessToken);
          SharedPrefHelper.removeData(SharedPrefKey.refreshToken);
        },
        child: Icon(Icons.logout, color: context.theme.appColors.textColor),
      ),
      title: Text(
        'Logout',
        style: context.theme.textTheme.displaySmall!.copyWith(
          color: context.theme.appColors.textColor,
          fontSize: 17.sp,
        ),
      ),
      page: const DashBoardView(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.title,
    required this.icon,
    required this.page,
  });

  final Text title;
  final Widget icon;
  final Widget page;
}
