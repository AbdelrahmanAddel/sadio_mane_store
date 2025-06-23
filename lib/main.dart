import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/app/env_variable.dart';
import 'package:sadio_mane_store/sadio_mane_app.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.getInstance.loadEnv(envType: EnvType.prod);
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    
  ]).then((_) {
    runApp(const SadioManeApp());
  });
}
