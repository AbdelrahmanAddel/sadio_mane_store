import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/notification/data/send_cloud_notification.dart';

class MyTestScreen extends StatefulWidget {
  const MyTestScreen({super.key});

  @override
  State<MyTestScreen> createState() => _MyTestScreenState();
}

class _MyTestScreenState extends State<MyTestScreen> {
  @override
  Widget build(BuildContext context) {
    final notification = NotificationsHelper.getInstance;
    return Scaffold(
      appBar: AppBar(title: const Text('Test Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              notification.isSubscribedInNotification
                  ? 'Subscribe'
                  : 'unSubscribe',
            ),
            ElevatedButton(
              onPressed: () async {
                await notification.notificationSubscribtionControll();
                setState(() {});
              },
              child: Icon(
                notification.isSubscribedInNotification
                    ? Icons.notifications_active
                    : Icons.notifications_off,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
