import 'package:sadio_mane_store/features/admin/notification/data/model/push_notification_model.dart';

Map<String, dynamic> getBody({
  required PushNotificationModel pushNotificationModel,
}) {
  return {
    'message': {
      'topic': 'news',
      'notification': {
        'title': pushNotificationModel.title,
        'body': pushNotificationModel.body,
      },
      'android': {
        'priority': 'HIGH',
        'notification': {'sound': 'default'},
      },
      'apns': {
        'payload': {
          'aps': {'sound': 'default', 'content-available': 1},
        },
      },
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'type': pushNotificationModel.type ?? 'message',
        'id': '123',
      },
    },
  };
}
