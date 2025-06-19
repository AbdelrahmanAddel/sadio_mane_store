import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/app/env_variable.dart';

class SadioManeApp extends StatelessWidget {
  const SadioManeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvVariable.getInstance.isDev,
      home: const Scaffold(),
    );
  }
}
