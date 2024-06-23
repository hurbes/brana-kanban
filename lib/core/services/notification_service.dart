import 'package:brana/core/mixins/app_logger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService with AppLogger {
  final _notification = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    const initializationSettingsDarwin = DarwinInitializationSettings(
      notificationCategories: [
        DarwinNotificationCategory(
          "task_reminder",
        ),
      ],
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _notification.initialize(initializationSettings);
  }

  Future<void> dismiss() async {
    await _notification.cancel(0);
  }

  Future<void> cancelNotification(int id) async {
    await _notification.cancel(id);
  }

  Future<void> scheduleNotification({
    required int id,
    required DateTime time,
    required String title,
    required String description,
  }) async {
    return await _notification.zonedSchedule(
      id,
      title,
      description,
      tz.TZDateTime.from(time, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'task-notification',
          'TASK_NOTIFICATION',
          channelDescription: 'TASK Reminder notification',
          priority: Priority.high,
          importance: Importance.max,
          enableVibration: true,
          playSound: true,
          visibility: NotificationVisibility.public,
        ),
        iOS: DarwinNotificationDetails(presentSound: true),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
