import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';

class LogoutDialog {
  static Future<void> show(BuildContext context) {
    return showDialog<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr.log_out),
        content: Text(context.tr.are_you_sure_you_want_to_log_out),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(context.tr.cancel),
          ),
          TextButton(
            onPressed: () => _performLogout(context),
            child: Text(context.tr.log_out),
          ),
        ],
      ),
    );
  }

  static void _performLogout(BuildContext context) {
    SharedPrefHelper.removeData(SharedPrefKey.accessToken);
    SharedPrefHelper.removeData(SharedPrefKey.refreshToken);
    context.pushAndRemoveUntil(
      routeName: RoutesString.signIn,
      predicate: (route) => false,
    );
  }
} 