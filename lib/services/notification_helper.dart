import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

Future<void> showNotification(String title, String body) async {
  await notifications.show(
    0,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails('attendance_channel', 'Attendance'),
    ),
  );
}
