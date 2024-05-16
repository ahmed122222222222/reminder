import 'dart:developer';

import 'package:ah/core/genratedid.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap
    );
  }

  static void onTap(NotificationResponse notificationResponse) {}

  static void showNotification() async {
    await flutterLocalNotificationsPlugin.show(
      0,
      "Base notification",
      'Welcome first notification',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "id 1",
          "base",
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  static void repeatNotification() async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      "Repeat notification",
      'Welcome first notification',
      RepeatInterval.everyMinute,
      const NotificationDetails(
        android: AndroidNotificationDetails("id 1", "repeat"),
      ),
    );
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

static void scheduleDailyRepeatingNotification(tz.TZDateTime startTime) async {
    tz.TZDateTime scheduledDate = startTime;
                                 
    for (int i = 1; i <= 480; i++) { // 480 notifications for 24 hours at 3-minute intervals
      await flutterLocalNotificationsPlugin.zonedSchedule(
      UniqueIdGenerator.generate(),
        "Daily Repeating",
        "Hi Ahmed, this is a daily repeating notification",
        scheduledDate,
        const NotificationDetails(android: AndroidNotificationDetails("id 4", "daily_repeating")),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "daily_repeating",
      );
      scheduledDate = scheduledDate.add(const Duration(minutes: 3)); // Add 3 minutes for the next notification
    }
  }

  static tz.TZDateTime calculateNextNotificationTime(tz.TZDateTime startTime) {
    return startTime;
  }


}
