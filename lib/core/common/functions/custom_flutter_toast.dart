import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> customFlutterToast({
  required String message,
  Color? backgroundColor,
  Color? textColor,
  double? fontSize,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: backgroundColor ?? Colors.red,
    textColor: textColor ?? Colors.white,
    fontSize: fontSize ?? 16,
  );
}
