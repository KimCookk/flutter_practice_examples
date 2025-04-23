import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/15_notification/notificationService.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Notificationservice.initialize();
  await requestNotificationPermission();

  runApp(NotificationApp());
}

Future<void> requestNotificationPermission() async {
  final status = await Permission.notification.request();

  if (status.isGranted) {
    print("✅ 알림 권한 허용됨");
  } else {
    print("❌ 알림 권한 거부됨");
  }
}

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Notificationservice.showNotification(
                    title: '테스트', body: '로컬 알림 테스트!');
              },
              child: Text('Show Push Notification'),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                final now = DateTime.now();
                final scheduled = now.add(const Duration(seconds: 5));

                Notificationservice.showScheduledNotification(
                  title: '예약 알림',
                  body: '10초 뒤에 도착하는 알림',
                  scheduledTime: scheduled,
                );

                debugPrint("📅 알림 예약됨: ${scheduled.toLocal()}");
              },
              child: Text('After 10s Push Notification'),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                Notificationservice.printScheduledNotificaiton();
              },
              child: Text('Show Push Notification List'),
            ),
          ],
        ),
      ),
    );
  }
}
