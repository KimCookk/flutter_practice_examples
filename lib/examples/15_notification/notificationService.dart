import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class Notificationservice {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidInit);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_notification_channel_id',
      'Default',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      0,
      title,
      body,
      platformDetails,
    );
  }

  static Future<void> showScheduledNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel_id',
      '기본채널',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: '알림 페이로드',
    );
  }

  static Future<void> printScheduledNotificaiton() async {
    final List<PendingNotificationRequest> pendingList =
        await FlutterLocalNotificationsPlugin().pendingNotificationRequests();

    for (var notif in pendingList) {
      print('알림 ID: ${notif.id}');
      print('제목: ${notif.title}');
      print('내용: ${notif.body}');
      print('페이로드: ${notif.payload}');
    }
  }
}
