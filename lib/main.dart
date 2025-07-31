import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/app_bloc_observer.dart';
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/app/sadio_mane_app.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/features/admin/notification/data/data_source/notification_local_data_source.dart';
import 'package:sadio_mane_store/features/admin/notification/data/send_cloud_notification.dart';
import 'package:sadio_mane_store/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _initApp();
  await _hiveInit();
  await NotificationsHelper.getInstance.initFirebaseMessaging();

  Bloc.observer = AppBlocObserver();
  await _lockOrientation();
  runApp(const SadioManeApp());
}

Future<void> _hiveInit() async {
  await NotificationLocalDataSource.initHive();
}

Future<void> _lockOrientation() async =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

Future<void> _initApp() async {
  await EnvVariable.getInstance.loadEnv(envType: EnvType.prod);
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();

  // Only try to get token if not on iOS simulator
  if (!_isIOSSimulator()) {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      debugPrint('Token =>> $token');
    } catch (e) {
      debugPrint('Error getting token: $e');
    }
  } else {
    debugPrint('⚠️ Skipping token fetch on iOS Simulator');
  }

  setUpGetIt();
}

bool _isIOSSimulator() {
  if (!Platform.isIOS) return false;

  final env = Platform.environment;
  return env.containsKey('SIMULATOR_DEVICE_NAME') ||
      env.containsKey('SIMULATOR_UDID') ||
      env['SIMULATOR_DEVICE_NAME'] != null;
}
