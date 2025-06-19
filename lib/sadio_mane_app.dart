import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/app/env_variable.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';

class SadioManeApp extends StatelessWidget {
  const SadioManeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvVariable.getInstance.isDev,
      home: const NoInternetScreen(),
    );
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.assetsImagesPngNoNetwork, fit: BoxFit.fill);
  }
}
