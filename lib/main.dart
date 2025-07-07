import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/app_bloc_observer.dart';
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/app/sadio_mane_app.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  Bloc.observer = AppBlocObserver();
  await _lockOrientation();
  runApp(const SadioManeApp());
}

Future<void> _lockOrientation() async =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

Future<void> _initApp() async {
  await EnvVariable.getInstance.loadEnv(envType: EnvType.prod);
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();
  setUpGetIt();
}
