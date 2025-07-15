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
import 'package:sadio_mane_store/features/notification/data/model/push_notification_model.dart';
import 'package:sadio_mane_store/features/notification/data/send_cloud_notification.dart';
import 'package:sadio_mane_store/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await _initApp();
  await NotificationsHelper.getInstance.initFirebaseMessaging();

  // Only send test notification if not on iOS simulator
  if (!_isIOSSimulator()) {
    await NotificationsHelper.getInstance.sendNotifications(
      pushNotificationModel: PushNotificationModel(
        fcmToken:
            'cZydCwNkQJuSTcUvH6H8a5:APA91bHasQoKyUCVGWnnh65rA9DsQn79Tt9oEXMIRLTfNeycfxsmA83n1rF4xtIqsUgd8bxScDePZtlVFc2qq2wTCMnzG2rSHFxn09Ka_1jBAra27QBOuMs',
        title: 'Hellow',
        body: 'Done',
        type: 'message',
      ),
    );
  } else {
    debugPrint('⚠️ Skipping notification test on iOS Simulator');
  }

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
