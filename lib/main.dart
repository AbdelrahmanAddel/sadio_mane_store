import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/app_bloc_observer.dart';
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/app/sadio_mane_app.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.getInstance.loadEnv(envType: EnvType.prod);
  await ScreenUtil.ensureScreenSize();
  Bloc.observer =AppBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    
  ]).then((_) {
    runApp(const SadioManeApp());
  });
}
