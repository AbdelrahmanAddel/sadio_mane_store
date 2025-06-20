import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushReplacement({required String routeName}) {
    return Navigator.of(this).pushReplacementNamed(routeName);
  }

  Future<dynamic> pushName({required String routeName}) {
    return Navigator.of(this).pushNamed(routeName);
  }

  Future<dynamic> pushAndRemoveUntil({
    required String routeName,
    required bool Function(Route<dynamic>) predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate);
  }

  void pop({required String routeName}) {
    return Navigator.of(this).pop();
  }
}
