import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sadio_mane_store/core/constants/hive_strings.dart';
import 'package:sadio_mane_store/features/admin/notification/data/model/notification_content_model.dart';

class NotificationLocalDataSource {
  NotificationLocalDataSource._();
  static late Box<NotificationContentModel> notificationBox;

  static Future<void> initHive() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(NotificationContentModelAdapter());
      notificationBox = await Hive.openBox<NotificationContentModel>(
        HiveStrings.notificationBox,
      );
      debugPrint('Hive Initiated Successfully ✅');
    } catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
    }
  }

  static Future<void> clearNotification() async {
    await notificationBox.clear();
  }
}
