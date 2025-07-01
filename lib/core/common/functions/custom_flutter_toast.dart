import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> customFlutterToast({
  required String errorMessage,
  Color? backgroundColor,
  Color? textColor,
  double? fontSize,
}) {
  return Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor ?? Colors.red,
    textColor: textColor ?? Colors.white,
    fontSize: fontSize ?? 16,
  );
}
