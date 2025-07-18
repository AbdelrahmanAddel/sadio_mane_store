import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';

class CustomFadeInDown extends StatelessWidget {
  const CustomFadeInDown({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CustomFadeInUp extends StatelessWidget {
  const CustomFadeInUp({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CustomFadeInLeft extends StatelessWidget {
  const CustomFadeInLeft({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return SharedPrefHelper.getBool(SharedPrefKey.language)
        ? FadeInLeft(
          delay: const Duration(milliseconds: 300),
          duration: Duration(milliseconds: duration),
          child: child,
        )
        : FadeInRight(
          delay: const Duration(milliseconds: 300),
          duration: Duration(milliseconds: duration),
          child: child,
        );
  }
}

class CustomFadeInRight extends StatelessWidget {
  const CustomFadeInRight({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return SharedPrefHelper.getBool(SharedPrefKey.language)
        ? FadeInRight(
          delay: const Duration(milliseconds: 300),
          duration: Duration(milliseconds: duration),
          child: child,
        )
        : FadeInLeft(
          delay: const Duration(milliseconds: 300),
          duration: Duration(milliseconds: duration),
          child: child,
        );
  }
}
