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

static void scheduleDailyRepeatingNotification(tz.TZDateTime startTime, int intervalHours,String body,String name) async {
  tz.TZDateTime scheduledDate = startTime;

  // حساب عدد التنبيهات في اليوم بناءً على الفاصل الزمني بالساعات
  int numberOfNotifications = 24 ~/ intervalHours;
log("id of local ${UniqueIdGenerator.generate()}");
  for (int i = 0; i < numberOfNotifications; i++) {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      UniqueIdGenerator.generate(),
      "تذكير لتناول الدواء",
      "تناول دواء $body",
      scheduledDate,
      const NotificationDetails(android: AndroidNotificationDetails("id 4", "daily_repeating")),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: "اسم الدكتور@$name",
    );
    scheduledDate = scheduledDate.add(Duration(hours: intervalHours)); // إضافة الفاصل الزمني بالساعات
  }
}

// دالة لحساب الوقت التالي للتنبيه
tz.TZDateTime calculateNextNotificationTime(tz.TZDateTime startTime) {
  return startTime;
}
//get pending notifactttion
static Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }
}
