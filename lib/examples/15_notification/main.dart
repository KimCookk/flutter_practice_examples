import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/15_notification/notificationService.dart';
import 'package:permission_handler/permission_handler.dart';
import 'home_page.dart';
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
